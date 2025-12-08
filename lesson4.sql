-- Alter 

ALTER TABLE table_name -- Alter table function specifically adding a column      
ADD column_name data_type;

ALTER TABLE table_name -- Modify column change the datatype of a column   
MODIFY column_name data_type;

ALTER TABLE PETSALE
MODIFY PET VARCHAR(20); -- This makes it variable i think
SELECT * FROM PETSALE;

ALTER TABLE `PETSALE` CHANGE `PET` `ANIMAL` varchar(20); -- Renaming a column

-- Create

CREATE TABLE TableName (  # Create tables      
   COLUMN1 datatype,     
   COLUMN2 datatype,    
   COLUMN3 datatype,    
   ...   
);    

CREATE TABLE PETSALE (
        ID INTEGER NOT NULL,
        PET CHAR(20),
        SALEPRICE DECIMAL(6,2),
        PROFIT DECIMAL(6,2),
        SALEDATE DATE
        );

CREATE TABLE PET (
        ID INTEGER NOT NULL,
        ANIMAL VARCHAR(20),
        QUANTITY INTEGER
        );

-- Insert

INSERT INTO PETSALE VALUES
        (1,'Cat',450.09,100.47,'2018-05-29'),
        (2,'Dog',666.66,150.76,'2018-06-01'),
        (3,'Parrot',50.00,8.9,'2018-06-04'),
        (4,'Hamster',60.60,12,'2018-06-11'),
        (5,'Goldfish',48.48,3.5,'2018-06-14');
        
INSERT INTO PET VALUES
        (1,'Cat',3),
        (2,'Dog',4),
        (3,'Hamster',2);

-- Update

UPDATE PETSALE SET QUANTITY = 9 WHERE ID = 1;
UPDATE PETSALE SET QUANTITY = 3 WHERE ID = 2;
UPDATE PETSALE SET QUANTITY = 2 WHERE ID = 3;
UPDATE PETSALE SET QUANTITY = 6 WHERE ID = 4;
UPDATE PETSALE SET QUANTITY = 24 WHERE ID = 5;

-- Drop

DROP TABLE TableName; -- Drop tables

DROP TABLE PET;

ALTER TABLE PETSALE -- Drop column
DROP COLUMN PROFIT;

-- Truncate

TRUNCATE TABLE PET ; -- Truncate a table meaning removing all values but not the whoe table
