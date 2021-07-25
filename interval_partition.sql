--==============================================================
-- INTERVAL PARTITION
--==============================================================
CREATE TABLE interval_example
( 
    product_id     NUMBER(6)
    , client_id      NUMBER
    , date_id        DATE
) 
PARTITION BY RANGE (date_id) 
INTERVAL(numtoyminterval(1, 'MONTH'))
( 
    PARTITION part_1 VALUES LESS THAN (TO_DATE('1-1-2008', 'DD-MM-YYYY')),
    PARTITION part_2 VALUES LESS THAN (TO_DATE('1-1-2009', 'DD-MM-YYYY')),
    PARTITION part_3 VALUES LESS THAN (TO_DATE('1-7-2009', 'DD-MM-YYYY')) );

--==============================================================
-- INTERVAL PARTITION: MERGE OPERATION
--==============================================================
ALTER TABLE interval_example
    MERGE PARTITIONS part_1, part_2;    
    
--==============================================================
-- INTERVAL PARTITION: MOVE OPERATION
--==============================================================
ALTER TABLE interval_example
    MOVE PARTITION part_2
        TABLESPACE ts_part;
        
--==============================================================
-- INTERVAL PARTITION: TRUNCATE OPERATION
--==============================================================
ALTER TABLE interval_example
    TRUNCATE PARTITION part_3;
    
--==============================================================
-- INTERVAL PARTITION: DROP OPERATION
--==============================================================
ALTER TABLE interval_example
    DROP PARTITION part_3;