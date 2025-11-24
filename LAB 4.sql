USE  CSE_3A_164

DROP TABLE CRICKET
CREATE TABLE CRICKET(
NAME VARCHAR(30),
CITY VARCHAR(30),
AGE INT
);

SELECT * FROM CRICKET

INSERT INTO CRICKET 
VALUES ('Sachin Tendulkar', 'Mumbai', 30), 
('Rahul Dravid', 'Bombay', 35),
('M. S. Dhoni', 'Jharkhand', 31),
('Suresh Raina', 'Gujarat', 30);

------------Create table Worldcup from cricket with all the columns and data.  --------------
DROP TABLE WORLDCUP
SELECT * INTO WORLDCUP FROM CRICKET

SELECT * FROM WORLDCUP

------------Create table T20 from cricket with first two columns with no data. --------------

DROP TABLE T20
SELECT NAME,CITY INTO T20 FROM CRICKET
WHERE 'A'='B'

SELECT * FROM T20

DROP TABLE T20



----------Create table IPL From Cricket with No Data. ------------

DROP TABLE IPL
SELECT * INTO IPL FROM CRICKET
WHERE 2=3

SELECT * FROM IPL

------------Select players who are either older than 30 and from 'Mumbai' or exactly 31 years old and not from 
------'Bombay', and insert them into a new table PLAYER. ------------
DROP TABLE PLAYER
SELECT *
INTO PLAYER
FROM CRICKET
WHERE (AGE > 30 AND CITY = 'MUMBAI')
   OR (AGE = 31 AND CITY <> 'BOMBAY');

SELECT * FROM PLAYER

------------Select players whose age is a prime number or their city belongs to India Country, and insert them into 
----------a new table PLAYER_INFO. (Consider Cricketer age between 18 to 55) 
DROP TABLE PLAYER_INFO
SELECT * INTO PLAYER_INFO
FROM CRICKET
WHERE AGE IN(19, 23, 29, 31, 37, 41, 43, 47, 53)
OR CITY IN('MUMBAI','BOMBAY','JHARKHAND','GUJARAT')

SELECT * FROM PLAYER_INFO

----------Select players whose age is a multiple of 5 and insert them into a new table PLAYER_DATA.-------------
DROP TABLE PLAYER_DATA
SELECT * INTO PLAYER_DATA FROM CRICKET
WHERE AGE %5=0 

SELECT * FROM PLAYER_DATA

-------- Insert the cricketer into IPL table whose city is ‘Jharkhand’ -----------

INSERT INTO IPL
SELECT *
FROM CRICKET
WHERE CITY = 'Jharkhand';

SELECT * FROM IPL

-----------PART-B------------------
DROP TABLE EMPLOYEE
CREATE TABLE EMPLOYEE(
NAME VARCHAR(30),
CITY VARCHAR(30),
AGE INT
)

INSERT INTO EMPLOYEE
VALUES('Jay Patel', 'Rajkot', 30), 
('Rahul Dave', 'Baroda', 35), 
('Jeet Patel', 'Surat', 31), 
('Vijay Raval', 'Rajkot', 30); 

SELECT * FROM EMPLOYEE

-------- Create table Employee_detail from Employee with all the columns and data.  -----------
DROP TABLE EMPLOYEE_DETAIL
SELECT * INTO EMPLOYEE_DETAIL FROM EMPLOYEE

SELECT * FROM EMPLOYEE_DETAIL

--------Create table Employee_data from Employee with first two columns with no data.----------
DROP TABLE EMPLOYEE_DATA
SELECT NAME,CITY INTO EMPLOYEE_DATA FROM EMPLOYEE
WHERE 2=3

SELECT * FROM EMPLOYEE_DATA

---------Create table Employee_info from Employee with no Data ----------
DROP TABLE EMPLOYEE_INFO
SELECT * INTO EMPLOYEE_INFO FROM EMPLOYEE
WHERE 'ABC'='BCD'

SELECT * FROM EMPLOYEE_INFO

-------------PART-C----------------


-------------Insert the Data into Employee_info from Employee whose CITY is Rajkot

INSERT INTO EMPLOYEE_INFO
SELECT *
FROM EMPLOYEE
WHERE CITY = 'RAJKOT';

SELECT * FROM EMPLOYEE_INFO

----------Insert the Data into Employee_info from Employee whose age is more than 32. 

INSERT INTO EMPLOYEE_INFO
SELECT * FROM EMPLOYEE
WHERE AGE>32

SELECT * FROM EMPLOYEE_INFO

------UPDATE OPERATION--------

----PART-A------
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

DROP TABLE BRANCH

CREATE TABLE BRANCH(
	BNAME VARCHAR(50), 
	CITY VARCHAR(50)
	);

INSERT INTO BRANCH 
VALUES ('VRCE','NAGPUR'),  
		('AJNI','NAGPUR'),  
		('KAROLBAGH','DELHI'),  
		('CHANDI','DELHI'),  
		('DHARAMPETH','NAGPUR'),  
		('M.G.ROAD','BANGLORE'),  
		('ANDHERI','BOMBAY'),  
		('VIRAR','BOMBAY'),  
		('NEHRU PLACE','DELHI'),  
		('POWAI','BOMBAY');

SELECT * FROM BRANCH

DROP TABLE CUSTOMERS

CREATE TABLE CUSTOMERS(
		CNAME VARCHAR(50), 
		CITY VARCHAR(50) 
);

INSERT INTO CUSTOMERS 
VALUES ('ANIL','CALCUTTA'), 
		('SUNIL','DELHI'),  
		('MEHUL','BARODA'),  
		('MANDAR','PATNA'),  
		('MADHURI','NAGPUR'),  
		('PRAMOD','NAGPUR'),  
		('SANDIP','SURAT'),  
		('SHIVANI','BOMBAY'),  
		('KRANTI','BOMBAY'),  
		('NAREN','BOMBAY');  
		
SELECT * FROM CUSTOMERS

DROP TABLE BORROW

CREATE TABLE BORROW(
		LOANNO INT, 
		CNAME VARCHAR(50), 
		BNAME VARCHAR(50), 
		AMOUNT DECIMAL(8,2)
);

INSERT INTO BORROW
VALUES (201,'ANIL','VRCE','1000.00'),  
(206,'MEHUL','AJNI','5000.00'),  
(311,'SUNIL','DHARAMPETH','3000.00'),  
(321,'MADHURI','ANDHERI','2000.00'),  
(375,'PRAMOD','VIRAR','8000.00'), 
(481,'KRANTI','NEHRU PLACE','3000.00');

SELECT * FROM BORROW

------ Update deposit amount of all customers from 3000 to 5000. (Use Deposit Table)---

UPDATE Deposit
SET Amount = 5000
WHERE Amount = 3000;

SELECT * FROM DEPOSIT

----Change branch name of ANIL from VRCE to C.G. ROAD. (Use Borrow Table)  ----

UPDATE Borrow
SET BNAME = 'C.G. ROAD'
WHERE CNAME = 'ANIL' AND BNAME = 'VRCE';



SELECT * FROM Borrow

---Update Account No of SANDIP to 111 & Amount to 5000. (Use Deposit Table) ---

UPDATE DEPOSIT
SET ACTNO = 111,AMOUNT = 5000
WHERE CNAME = 'SANDIP'

SELECT * FROM DEPOSIT

---Update amount of KRANTI to 7000. (Use Deposit Table) ---

UPDATE DEPOSIT
SET AMOUNT = 7000
WHERE CNAME = 'KRANTI'

SELECT * FROM DEPOSIT

---Update branch name from ANDHERI to ANDHERI WEST. (Use Branch Table)---
UPDATE BRANCH
SET BNAME = 'ANDHERI WEST'
WHERE BNAME = 'ANDHERI'

SELECT * FROM BRANCH

--- Update branch name of MEHUL to NEHRU PALACE. (Use Deposit Table) ---
UPDATE DEPOSIT
SET BNAME = 'NEHRU PALACE'
WHERE CNAME = 'MEHUL'

SELECT * FROM DEPOSIT

---Update deposit amount of all depositors to 5000 whose account no between 103 & 107. (Use Deposit Table) 

UPDATE DEPOSIT
SET AMOUNT = 5000
WHERE ACTNO BETWEEN 103 AND 107

SELECT * FROM DEPOSIT

---Update ADATE of ANIL to 1-4-95. (Use Deposit Table) 

UPDATE DEPOSIT
SET ADATE = '1995-04-01'
WHERE CNAME = 'ANIL'

SELECT * FROM DEPOSIT

----Update the amount of MINU to 10000. (Use Deposit Table)

UPDATE DEPOSIT
SET AMOUNT = 10000
WHERE CNAME = 'MINU'

SELECT * FROM DEPOSIT

---Update deposit amount of PRAMOD to 5000 and ADATE to 1-4-96 (Use Deposit Table) 

UPDATE DEPOSIT
SET AMOUNT = 5000,ADATE = '1996-04-01'
WHERE CNAME = 'PRAMOD'

SELECT * FROM DEPOSIT

----------------------PART-B-----------------

--- Give 10% Increment in Loan Amount. (Use Borrow Table)


UPDATE BORROW
SET AMOUNT = AMOUNT * 1.10;

SELECT * FROM BORROW;


------ Customer deposits additional 20% amount to their account, update the same. (Use Deposit Table) 

UPDATE BORROW
SET AMOUNT = AMOUNT * 1.20;

SELECT * FROM BORROW;


SELECT * FROM BORROW
----- Increase Amount by 1000 in all the account.  (Use Deposit Table) 
UPDATE DEPOSIT
SET AMOUNT = AMOUNT+1000

SELECT * FROM DEPOSIT

------Update the BORROW table to set the amount to 7000 and the branch name to 'CENTRAL' where the 
----customer name is ‘MEHUL’ and the loan number is even. 

UPDATE BORROW
SET AMOUNT = 7000, BNAME = 'CENTRAL'
WHERE CNAME = 'MEHUL'AND LOANNO%2=0 

SELECT * FROM BORROW
----- Update the DEPOSIT table to set the date to '2022-05-15' and the amount to 2500 for all accounts in 
------‘VRCE’ and with an account number less than 105. 

UPDATE DEPOSIT
SET ADATE = '2022-05-15', AMOUNT = 2500
WHERE BNAME= 'VRCE' AND ACTNO<105

SELECT * FROM DEPOSIT

----------PART-C-------

---Update amount of loan no 321 to NULL. (Use Borrow Table)

UPDATE BORROW
SET AMOUNT = NULL
WHERE LOANNO = 321

SELECT * FROM BORROW

---Update branch name of KRANTI to NULL (Use Borrow Table)

UPDATE BORROW
SET BNAME = NULL
WHERE CNAME = 'KRANTI'

SELECT * FROM BORROW

---Display the name of borrowers whose Loan number is NULL. (Use Borrow Table)

SELECT CNAME FROM BORROW
WHERE LOANNO IS NULL

---Display the Borrowers whose having branch. (Use Borrow Table) 

SELECT CNAME FROM BORROW
WHERE BNAME IS NOT NULL

----Update the Loan Amount to 5000, Branch to VRCE & Customer Name to Darshan whose loan no is 481. (Use Borrow Table) 

UPDATE BORROW
SET AMOUNT = 5000,BNAME = 'VRCE',CNAME = 'DARSHAN'
WHERE LOANNO = 481

SELECT * FROM BORROW

---Update the Deposit table and set the date to 01-01-2021 for all the depositor whose amount is less than 2000. 

UPDATE DEPOSIT
SET ADATE = '2021-01-01'
WHERE AMOUNT<2000

SELECT * FROM DEPOSIT

--- Update the Deposit table and set the date to NULL & Branch name to ‘ANDHERI whose Account No is 110. 
UPDATE DEPOSIT
SET ACTNO = NULL,BNAME = 'ANDHERI'
WHERE ACTNO = 110

SELECT * FROM DEPOSIT



