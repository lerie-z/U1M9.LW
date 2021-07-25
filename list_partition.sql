--==============================================================
-- LIST PARTITION
--==============================================================
CREATE TABLE list_example
    ( state_cd VARCHAR2(2),
          DATA VARCHAR2(20)
    )
 PARTITION BY LIST(state_cd)
   ( PARTITION p1 VALUES ( 'ME', 'NH', 'VT', 'MA' ),
     PARTITION p2 VALUES ( 'CT', 'RI', 'NY' )
   );

--==============================================================
-- LIST PARTITION: MERGE OPERATION
--==============================================================
ALTER TABLE list_example
    MERGE PARTITIONS p1, p2
      INTO PARTITION p3;    
      
--==============================================================
-- LIST PARTITION: SPLIT OPERATION
--==============================================================
ALTER TABLE list_example
    SPLIT PARTITION p3 VALUES ('ME', 'NH', 'MA')
      INTO 
      (
        PARTITION p1,
        PARTITION p2); 
    
--==============================================================
-- LIST PARTITION: MOVE OPERATION
--==============================================================
ALTER TABLE list_example
    MOVE PARTITION p1
        TABLESPACE ts_part;
        
--==============================================================
-- LIST PARTITION: TRUNCATE OPERATION
--==============================================================
ALTER TABLE list_example
    TRUNCATE PARTITION p1;
    
--==============================================================
-- LIST PARTITION: DROP OPERATION
--==============================================================
ALTER TABLE list_example
    DROP PARTITION part_1;