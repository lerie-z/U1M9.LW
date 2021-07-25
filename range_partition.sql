--==============================================================
-- RANGE PARTITION
--==============================================================
CREATE TABLE range_example
( 
    range_key_column DATE         NOT NULL,
                 DATA VARCHAR2(20)
)
PARTITION BY RANGE (range_key_column)
( 
    PARTITION part_1 VALUES LESS THAN (TO_DATE('01/01/2010','dd/mm/yyyy')),
    PARTITION part_2 VALUES LESS THAN (TO_DATE('01/01/2011','dd/mm/yyyy'))
 );
 
--==============================================================
-- RANGE PARTITION: MERGE OPERATION
--==============================================================
 ALTER TABLE range_example
    MERGE PARTITIONS part_1, part_2 INTO PARTITION part_3
    TABLESPACE ts_partitions_1;
    
--==============================================================
-- RANGE PARTITION: MOVE OPERATION
--==============================================================
ALTER TABLE range_example
    MOVE PARTITION part_3
        TABLESPACE ts_partitions_1;
        
--==============================================================
-- RANGE PARTITION: SPLIT OPERATION
--==============================================================
ALTER TABLE range_example
    SPLIT PARTITION part_3
        AT (TO_DATE('01/06/2010', 'DD/MM/YYYY'))
            INTO(PARTITION part_1, PARTITION part_2);
            
--==============================================================
-- RANGE PARTITION: TRUNCATE OPERATION
--==============================================================
ALTER TABLE range_example
    TRUNCATE PARTITION part_1;
    
--==============================================================
-- RANGE PARTITION: DROP OPERATION
--==============================================================
ALTER TABLE range_example
    DROP PARTITION part_1;