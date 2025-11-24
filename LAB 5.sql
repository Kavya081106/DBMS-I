USE  CSE_3A_164

DROP TABLE DEPOSIT

CREATE TABLE DEPOSIT(
		ACTNO INT,
		CNAME VARCHAR(50),
		BNAME VARCHAR(50),
		AMOUNT DECIMAL(8,2),
		ADATE DATE
);



SELECT * FROM DEPOSIT


INSERT INTO DEPOSIT 
VALUES (101, 'ANIL','VRCE','1000.00','1995-03-01'),
		(102,'SUNIL','AJNI','5000.00', '1996-01-04'),
		(103, 'MEHUL','KAROLBAGH','3500.00','1995-11-17'),
		(104,'MADHURI','CHANDI','1200.00','1995-12-17'),
		(105,'PRAMOD','M.G. ROAD','3000.00','1996-03-27'),
		(106,'SANDIP','ANDHERI','2000.00','1996-03-31'),
		(107,'SHIVANI','VIRAR','1000.00','1995-09-05'),
		(108,'KRANTI','NEHRU PLACE','5000.00','1995-07-02'), 
		(109,'MINU','POWAI','7000.00','1995-08-10');

---PART-A----
---Add two more columns City VARCHAR (20) and Pincode INT.

ALTER TABLE DEPOSIT
ADD CITY VARCHAR(20),PINCODE INT

SELECT * FROM DEPOSIT

---Add column state VARCHAR(20). 

ALTER TABLE DEPOSIT
ADD STATE VARCHAR(20)

---Change the size of CNAME column from VARCHAR (50) to VARCHAR (35).

ALTER TABLE DEPOSIT
ALTER COLUMN CNAME VARCHAR(35);

---Change the data type DECIMAL to INT in amount Column. 
ALTER TABLE DEPOSIT
ALTER COLUMN AMOUNT INT;

----Delete Column City from the DEPOSIT table.

ALTER TABLE DEPOSIT
DROP COLUMN CITY;

---Rename Column ActNo to ANO. 

SP_RENAME 'DEPOSIT.ACTNO', 'ANO'  

SELECT * FROM DEPOSIT

---Change name of table DEPOSIT to DEPOSIT_DETAIL.

DROP TABLE DEPOSIT_DETAIL
SP_RENAME 'DEPOSIT','DEPOSIT_DETAIL'


SELECT * FROM DEPOSIT_DETAIL

---PART-B------

----Rename Column ADATE to AOPENDATE OF DEPOSIT_DETAIL table.
SP_RENAME 'DEPOSIT_DETAIL.ADATE','AOPENDATE'

SELECT * FROM DEPOSIT_DETAIL

---Delete Column AOPENDATE from the DEPOSIT_DETAIL table. 

ALTER TABLE DEPOSIT_DETAIL
DROP COLUMN AOPENDATE

SELECT * FROM DEPOSIT_DETAIL

---Rename Column CNAME to CustomerName. 

SP_RENAME 'DEPOSIT_DETAIL.CNAME', 'CustomerName'

SELECT * FROM DEPOSIT_DETAIL

---Add Column country. 
ALTER TABLE DEPOSIT_DETAIL
ADD COUNTRY VARCHAR(25)

SELECT * FROM DEPOSIT_DETAIL

----PART-C---

CREATE TABLE STUDENT_DETAIL(
Enrollment_No VARCHAR(20), 
Name VARCHAR(25),
CPI DECIMAL(5,2),
Birthdate DATETIME 
);

---Add two more columns City VARCHAR (20) (Not null) and Backlog INT (Null). 
DROP TABLE STUDENT_DETAIL

ALTER TABLE STUDENT_DETAIL
ADD CITY VARCHAR(20) NOT NULL,
BACKLOG INT NULL



SELECT * FROM STUDENT_DETAIL



----Add column department VARCHAR (20) Not Null. 

ALTER TABLE STUDENT_DETAIL
ADD DEPARTMENT VARCHAR(20) NOT NULL 

SELECT * FROM STUDENT_DETAIL

---- Change the size of NAME column of student_detail from VARCHAR (25) to VARCHAR (35). 

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN NAME VARCHAR(35)

SELECT * FROM STUDENT_DETAIL

-----Change the data type DECIMAL to INT in CPI Column. 

ALTER TABLE STUDENT_DETAIL
ALTER COLUMN CPI INT 

----Delete Column City from the student_detail table. 

ALTER TABLE STUDENT_DETAIL
DROP COLUMN CITY

SELECT * FROM STUDENT_DETAIL

----Rename Column Enrollment_No to ENO. 

SP_RENAME 'STUDENT_DETAIL.ENROLLMENT_NO', 'ENO'

SELECT * FROM STUDENT_DETAIL

----Change name of table student_detail to STUDENT_MASTER.

SP_RENAME 'STUDENT_DETAIL','STUDENT_MASTER'

SELECT * FROM STUDENT_MASTER

------DELETE, Truncate, Drop Operation 

-----PART-A----

SELECT * FROM DEPOSIT_DETAIL 

------Delete all the records of DEPOSIT_DETAIL table having amount less than and equals to 4000. 

DELETE FROM DEPOSIT_DETAIL
WHERE AMOUNT<=4000

SELECT * FROM DEPOSIT_DETAIL

-----Delete all the accounts CHANDI BRANCH. 

DELETE FROM DEPOSIT_DETAIL
WHERE BNAME = 'CHANDI'

------Delete all the accounts having account number (ANO) is greater than 102 and less than 105.

DELETE FROM DEPOSIT_DETAIL
WHERE ANO>102 AND ANO<105

-----Delete all the accounts whose branch is ‘AJNI’ or ‘POWAI’ 

DELETE FROM DEPOSIT_DETAIL
WHERE BNAME IN('AJNI','POWAI')

-----Delete all the accounts whose account number is NULL. 

DELETE FROM DEPOSIT_DETAIL
WHERE ANO IS NULL

-----Delete all the remaining records using Delete command. 

DELETE FROM DEPOSIT_DETAIL

SELECT * FROM DEPOSIT_DETAIL

----Delete all the records of Deposit_Detail table. (Use Truncate) 

TRUNCATE TABLE DEPOSIT_DETAIL

-----Remove Deposit_Detail table. (Use Drop) 

DROP TABLE DEPOSIT_DETAIL

-----PART-B-----

CREATE TABLE EMPLOYEE_MASTER(
	EmpNo INT, 
	EmpName VARCHAR(25), 
	JoiningDate DATETIME, 
	Salary DECIMAL (8,2), 
	City VARCHAR(20) 
);

INSERT INTO EMPLOYEE_MASTER 
VALUES(101, 'Keyur', '2002-01-05', 12000.00, 'Rajkot'), 
(102, 'Hardik', '2004-02-15', 14000.00, 'Ahmedabad'), 
(103, 'Kajal', '2006-03-14', 15000.00, 'Baroda'), 
(104, 'Bhoomi', '2005-06-23', 12500.00, 'Ahmedabad'), 
(105, 'Harmit', '2004-02-15', 14000.00, 'Rajkot'),
(106, 'Mitesh', '2001-09-25', 5000.00, 'Jamnagar'), 
(107, 'Meera', Null, 7000.00, 'Morbi'), 
(108, 'Kishan', '2003-02-06', 10000.00, NULL);

SELECT * FROM EMPLOYEE_MASTER

---Delete all the records of Employee_MASTER table having salary greater than and equals to 14000.  

DELETE FROM EMPLOYEE_MASTER
WHERE SALARY>=14000

-----Delete all the Employees who belongs to ‘RAJKOT’ city.
DELETE FROM EMPLOYEE_MASTER
WHERE CITY='RAJKOT'

-------Delete all the Employees who joined after 1-1-2007
DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate>'2007-01-01'

-----Delete the records of Employees whose joining date is null and Name is not null.
DELETE FROM EMPLOYEE_MASTER
WHERE JoiningDate IS NULL AND EmpName IS NOT NULL

-----Delete the records of Employees whose salary is 50% of 20000.

DELETE FROM EMPLOYEE_MASTER
WHERE SALARY = 20000*0.5

-----Delete the records of Employees whose City Name is not empty.

DELETE FROM EMPLOYEE_MASTER 
WHERE CITY IS NOT NULL

SELECT * FROM EMPLOYEE_MASTER

-----Delete all the records of Employee_MASTER table. (Use Truncate)

TRUNCATE TABLE EMPLOYEE_MASTER

SELECT * FROM EMPLOYEE_MASTER

-----Remove Employee_MASTER table. (Use Drop) 

DROP TABLE EMPLOYEE_MASTER



























