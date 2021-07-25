--==============================================================
-- HASH PARTITION
--==============================================================
CREATE TABLE hash_example
   ( hash_key_column   date,
                data   varchar2(20)
 )
  PARTITION BY HASH (hash_key_column)
  ( 
    partition part_1 tablespace ts_partitions_1,
    partition part_2 tablespace ts_partitions_1
  );
    
--==============================================================
-- HASH PARTITION: MOVE OPERATION
--==============================================================
ALTER TABLE hash_example
    MOVE PARTITION part_2
        TABLESPACE ts_partitions_2;
        

--==============================================================
-- RANGE PARTITION: TRUNCATE OPERATION
--==============================================================
ALTER TABLE hash_example
    TRUNCATE PARTITION part_1;
    
--==============================================================
-- HASH PARTITION: DROP OPERATION
--==============================================================
ALTER TABLE hash_example
    DROP PARTITION part_1;