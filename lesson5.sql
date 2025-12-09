-- String Patterns, Sorting and Grouping
-- Initialising tables in databse HR
CREATE TABLE EMPLOYEES ( 
                            EMP_ID CHAR(9) NOT NULL, 
                            F_NAME VARCHAR(15) NOT NULL,
                            L_NAME VARCHAR(15) NOT NULL,
                            SSN CHAR(9),
                            B_DATE DATE,
                            SEX CHAR,
                            ADDRESS VARCHAR(30),
                            JOB_ID CHAR(9),
                            SALARY DECIMAL(10,2),
                            MANAGER_ID CHAR(9),
                            DEP_ID CHAR(9) NOT NULL,
                            PRIMARY KEY (EMP_ID));
                            
  CREATE TABLE JOB_HISTORY (
                            EMPL_ID CHAR(9) NOT NULL, 
                            START_DATE DATE,
                            JOBS_ID CHAR(9) NOT NULL,
                            DEPT_ID CHAR(9),
                            PRIMARY KEY (EMPL_ID,JOBS_ID));
 
 CREATE TABLE JOBS (
                            JOB_IDENT CHAR(9) NOT NULL, 
                            JOB_TITLE VARCHAR(30),
                            MIN_SALARY DECIMAL(10,2),
                            MAX_SALARY DECIMAL(10,2),
                            PRIMARY KEY (JOB_IDENT));

CREATE TABLE DEPARTMENTS (
                            DEPT_ID_DEP CHAR(9) NOT NULL, 
                            DEP_NAME VARCHAR(15) ,
                            MANAGER_ID CHAR(9),
                            LOC_ID CHAR(9),
                            PRIMARY KEY (DEPT_ID_DEP));

CREATE TABLE LOCATIONS (
                            LOCT_ID CHAR(9) NOT NULL,
                            DEP_ID_LOC CHAR(9) NOT NULL,
                            PRIMARY KEY (LOCT_ID,DEP_ID_LOC));
                

INSERT INTO `DEPARTMENTS` VALUES ('2', 'Architect Group', '30001', 'L0001'); 
INSERT INTO `DEPARTMENTS` VALUES ('5', 'Software Group', '30002', 'L0002'); 
INSERT INTO `DEPARTMENTS` VALUES ('7', 'Design Team', '30003', 'L0003'); 

INSERT INTO `EMPLOYEES` VALUES ('E1001', 'John', 'Thomas', '123456', '1976-09-01', 'M', '5631 Rice, OakPark,IL', '100', '100000', '30001', '2');
INSERT INTO `EMPLOYEES` VALUES ('E1002', 'Alice', 'James', '123457', '1972-07-31', 'F', '980 Berry ln, Elgin,IL', '200', '80000', '30002', '5');
INSERT INTO `EMPLOYEES` VALUES ('E1003', 'Steve', 'Wells', '123458', '1980-10-08', 'M', '291 Springs, Gary,IL', '300', '50000', '30002', '5');
INSERT INTO `EMPLOYEES` VALUES ('E1004', 'Santosh', 'Kumar', '123459', '1985-07-20', 'M', '511 Aurora Av, Aurora,IL', '400', '60000', '30002', '5');
INSERT INTO `EMPLOYEES` VALUES ('E1005', 'Ahmed', 'Hussain', '123410', '1981-04-01', 'M', '216 Oak Tree, Geneva,IL', '500', '70000', '30001', '2');
INSERT INTO `EMPLOYEES` VALUES ('E1006', 'Nancy', 'Allen', '123411', '1978-06-02', 'F', '111 Green Pl, Elgin,IL', '600', '90000', '30001', '2');
INSERT INTO `EMPLOYEES` VALUES ('E1007', 'Mary', 'Thomas', '123412', '1975-05-05', 'F', '100 Rose Pl, Gary,IL', '650', '65000', '30003', '7');
INSERT INTO `EMPLOYEES` VALUES ('E1008', 'Bharath', 'Gupta', '123413', '1985-06-05', 'M', '145 Berry Ln, Naperville,IL', '660', '65000', '30003', '7');
INSERT INTO `EMPLOYEES` VALUES ('E1009', 'Andrea', 'Jones', '123414', '1990-09-07', 'F', '120 Fall Creek, Gary,IL', '234', '70000', '30003', '7');
INSERT INTO `EMPLOYEES` VALUES ('E1010', 'Ann', 'Jacob', '123415', '1982-03-30', 'F', '111 Britany Springs,Elgin,IL', '220', '70000', '30002', '5'); 

INSERT INTO `JOBS` VALUES ('100', 'Sr. Architect', '60000', '100000');
INSERT INTO `JOBS` VALUES ('200', 'Sr. Software Developer', '60000', '80000');
INSERT INTO `JOBS` VALUES ('300', 'Jr.Software Developer', '40000', '60000');
INSERT INTO `JOBS` VALUES ('400', 'Jr.Software Developer', '40000', '60000');
INSERT INTO `JOBS` VALUES ('500', 'Jr. Architect', '50000', '70000');
INSERT INTO `JOBS` VALUES ('600', 'Lead Architect', '70000', '100000');
INSERT INTO `JOBS` VALUES ('650', 'Jr. Designer', '60000', '70000');
INSERT INTO `JOBS` VALUES ('660', 'Jr. Designer', '60000', '70000');
INSERT INTO `JOBS` VALUES ('234', 'Sr. Designer', '70000', '90000');
INSERT INTO `JOBS` VALUES ('220', 'Sr. Designer', '70000', '90000'); 

INSERT INTO `JOB_HISTORY` VALUES ('E1001', '2000-08-01', '100', '2');
INSERT INTO `JOB_HISTORY` VALUES ('E1002', '2001-08-01', '200', '5');
INSERT INTO `JOB_HISTORY` VALUES ('E1003', '2001-08-16', '300', '5');
INSERT INTO `JOB_HISTORY` VALUES ('E1004', '2000-08-16', '400', '5');
INSERT INTO `JOB_HISTORY` VALUES ('E1005', '2000-05-30', '500', '2');
INSERT INTO `JOB_HISTORY` VALUES ('E1006', '2001-08-16', '600', '2');
INSERT INTO `JOB_HISTORY` VALUES ('E1007', '2002-05-30', '650', '7');
INSERT INTO `JOB_HISTORY` VALUES ('E1008', '2010-05-06', '660', '7');
INSERT INTO `JOB_HISTORY` VALUES ('E1009', '2016-08-16', '234', '7');
INSERT INTO `JOB_HISTORY` VALUES ('E1010', '2016-08-16', '220', '5'); 

INSERT INTO `LOCATIONS` VALUES ('L0001', '2');
INSERT INTO `LOCATIONS` VALUES ('L0002', '5');
INSERT INTO `LOCATIONS` VALUES ('L0003', '7'); 

-- String patterns can be used to filter queries

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE ADDRESS LIKE '%Elgin,IL%'; -- Retrieve first and last name of those who live in Elgin,IL using the LIKE operator as the ADDRESS contains more than what we are looking for

SELECT F_NAME, L_NAME
FROM EMPLOYEES
WHERE B_DATE LIKE '197%'; -- Percentage is relative to where the irrelavant text is  so we know in year the year comes first thats why we onlu have a percentage after.

SELECT *
FROM EMPLOYEES
WHERE (SALARY BETWEEN 60000 AND 70000) AND DEP_ID = 5; -- The Between operator is used to find range alongside the AND operator for multiple filters

SELECT DEP_ID, AVG(SALARY) -- HAVING operator is a specific use case for after group by i think similaor to WHERE
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING AVG(SALARY) >= 60000

-- Sorting queries

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID; -- ORDER by orders things as expected

SELECT F_NAME, L_NAME, DEP_ID 
FROM EMPLOYEES
ORDER BY DEP_ID DESC, L_NAME DESC; -- Order by multiple things and the DESC shows its descending order.

-- Grouping queries

SELECT DEP_ID, COUNT(*)
FROM EMPLOYEES
GROUP BY DEP_ID; -- Two column table showing the DEP_ID and the count of individuals with the same DEP_ID using the GROUP BY operator

SELECT DEP_ID, COUNT(*), AVG(SALARY) -- Same as above by including the average salary of each DEP_ID    
FROM EMPLOYEES
GROUP BY DEP_ID;

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY" -- Here we can label the output columns with the AS operator
FROM EMPLOYEES
GROUP BY DEP_ID;

SELECT DEP_ID, COUNT(*) AS "NUM_EMPLOYEES", AVG(SALARY) AS "AVG_SALARY"
FROM EMPLOYEES
GROUP BY DEP_ID
ORDER BY AVG_SALARY; -- Here is a combination of a Grouping and Sorting technique.

-- Practise questions
-- Retrieve the list of all employees, first and last names, whose first names start with ‘S’.

SELECT F_NAME, L_NAME -- CORRECT
FROM EMPLOYEES
WHERE F_NAME LIKE 'S%'

-- Arrange all the records of the EMPLOYEES table in ascending order of the date of birth.

SELECT * -- CORRECT
FROM EMPLOYEES
ORDER BY B_DATE 

-- Group the records in terms of the department IDs and filter them of ones that have average salary more than or equal to 60000. Display the department ID and the average salary.

SELECT DEP_ID, AVG(SALARY) -- CORRECT
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING AVG(SALARY) >= 60000

-- For the problem above, sort the results for each group in descending order of average salary.

SELECT DEP_ID, AVG(SALARY) -- CORRECT
FROM EMPLOYEES
GROUP BY DEP_ID
HAVING AVG(SALARY) >= 60000
ORDER BY AVG(SALARY) DESC