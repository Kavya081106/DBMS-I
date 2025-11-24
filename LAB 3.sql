CREATE DATABASE CSE_3A_164 

USE CSE_3A_164

DROP TABLE DEPOSIT

CREATE TABLE DEPOSIT(
		ACTNO INT,
		CNAME VARCHAR(50),
		BNAME VARCHAR(50),
		AMOUNT DECIMAL(8,2),
		ADATE DATE
);

SELECT * FROM DEPOSIT

DELETE FROM DEPOSIT

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

---- LAB 3----


-----Retrieve all data from table DEPOSIT. ------
SELECT * FROM DEPOSIT

----------Retrieve all data from table BORROW.  --------------

SELECT * FROM BORROW

-----------Display Account No, Customer Name & Amount from DEPOSIT.--------------

SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT

---------------Display Loan No, Amount from BORROW. -----------------

SELECT LOANNO,AMOUNT FROM BORROW

-------------- Display loan details of all customers who belongs to ‘ANDHERI’ branch from borrow table. ----------------

SELECT * FROM BORROW
WHERE BNAME='ANDHERI'

----------------Give account no and amount of depositor, whose account no is equals to 106 from deposit table. --------------------


SELECT ACTNO,AMOUNT 
FROM DEPOSIT
WHERE ACTNO=106

-------------Give name of borrowers having amount greater than 5000 from borrow table. ------------------

SELECT CNAME FROM BORROW
WHERE AMOUNT>5000

----------------Give name of customers who opened account after date '1995-12-01' from deposit table.-------------------

SELECT CNAME FROM DEPOSIT
WHERE ADATE>'1995-12-01'

-------------Display name of customers whose account no is less than 105 from deposit table. ------------------

SELECT CNAME FROM DEPOSIT
WHERE ACTNO<105

------------------ Display name of customer who belongs to either ‘NAGPUR’ or ‘DELHI’ from customer table. (USE OR & IN) ---------------

SELECT CNAME FROM CUSTOMERS
WHERE (CITY='NAGPUR') OR (CITY='DELHI')

SELECT CNAME FROM CUSTOMERS
WHERE CITY IN('NAGPUR','DELHI')

-----------Display name of customers with branch whose amount is greater than 4000 and account no is less than 105 from deposit table. --------------------

SELECT CNAME FROM DEPOSIT
WHERE (AMOUNT> 4000) AND (ACTNO<105) 

------------Find all borrowers whose amount is greater than equals to 3000 & less than equals to 8000 from borrow table. (USE AND & BETWEEN) --------------

SELECT * FROM BORROW
WHERE (AMOUNT>=3000) AND (AMOUNT<=8000)

SELECT * FROM BORROW
WHERE AMOUNT BETWEEN 3000 AND 8000


-----------------Find all depositors who do not belongs to ‘ANDHERI’ branch from deposit table.---------------------

SELECT * FROM DEPOSIT
WHERE (BNAME!='ANDHERI')

------------- Display Account No, Customer Name & Amount of such customers who belongs to ‘AJNI’, ‘KAROLBAGH’ 
--------------Or ‘M.G. ROAD’ and Account No is less than 104 from deposit table. ------------------

SELECT ACTNO,CNAME,AMOUNT FROM DEPOSIT
WHERE BNAME IN('AJNI','KAROLBAGH','M.G. ROAD') AND ACTNO<104


---------------Display all loan no, customer from borrow table does not belong to ‘VIRAR’ or ‘AJNI’ branch. (use NOT 
--IN) -----------------

SELECT LOANNO, CNAME FROM BORROW
WHERE BNAME NOT IN('VIRAR','AJNI');

------------- Display all the customer’s name other than ‘MINU’ from deposit table (Use: NOT, <>, !=)-------------

SELECT CNAME FROM DEPOSIT 
WHERE NOT CNAME='MINU'

SELECT CNAME FROM DEPOSIT 
WHERE CNAME!='MINU'

SELECT CNAME FROM DEPOSIT 
WHERE CNAME<>'MINU'

-------------- Display customer name from deposit table whose branch name is not available. (NULL) ------------------

SELECT CNAME FROM DEPOSIT 
WHERE BNAME IS NULL

-------------Retrieve all unique branches using DISTINCT. (Use Branch Table) ---------------

SELECT DISTINCT	BNAME FROM BRANCH

--------------Retrieve first 50% record from borrow table. ---------------

SELECT TOP 50 PERCENT*
FROM BORROW

----------Retrieve first five account number from deposit table. -----------

SELECT TOP 5 ACTNO
FROM DEPOSIT 

----------------------------------------------------PART-B----------------------------------------------------------------------------

---------------Display all the details of first five customers from deposit table. ------------------

SELECT TOP 5* FROM DEPOSIT

--------------Display all the details of first three depositors from deposit table whose amount is greater than 1000. ----------------

SELECT TOP 3* FROM DEPOSIT 
WHERE AMOUNT>1000

--------------Display Loan No, Customer Name of first five borrowers whose branch name does not belongs to 
-------‘ANDHERI’ from borrow table. ---------------

SELECT TOP 5 LOANNO,CNAME FROM BORROW
WHERE BNAME!='ANDHERI'

----------Select all details with account numbers not in the range 105 to 109 in deposit table. ---------------

SELECT * FROM DEPOSIT
WHERE ACTNO NOT BETWEEN 105 AND 109


---------------Select all records from BORROW where the amount is greater than 1000 and less than or equal to 7000, 
------and the loan number is between 250 and 600------------------


SELECT * FROM BORROW
WHERE (AMOUNT>1000)AND(AMOUNT<=7000)AND LOANNO BETWEEN 250 AND 600

------PART-C----------------

-----------------Display all the detail of customer who deposited more than 5000 without using * from deposit table.------------------------------

SELECT ACTNO, CNAME, BNAME, AMOUNT, ADATE FROM DEPOSIT
WHERE AMOUNT>5000

------------------Retrieve all unique customer names with city. (Use Customer table) ---------------------

SELECT DISTINCT CNAME,CITY FROM CUSTOMERS 

-----------------Retrieve records from the BORROW table where the loan amount is greater than 3000 and the loan 
----number is not a multiple of 3. ---------------------

SELECT * FROM BORROW 
WHERE AMOUNT>3000 AND LOANNO%3!=0

----------------Retrieve records from the DEPOSIT table where amount is greater than 2000 also account number is 
--------between 100 and 110 and date is after '1-MAR-1995' or before '27-MAR-1996'. -----------------

SELECT * FROM DEPOSIT 
WHERE (AMOUNT>2000) AND (ACTNO BETWEEN 100 AND 110) AND (ADATE > '1995-03-01' OR ADATE < '1996-03-27') 

-----------Retrieve all odd/even value loan number from Borrow table. ---------------

--EVEN--

SELECT *
FROM BORROW
WHERE LOANNO % 2 = 0;

--ODD--

SELECT * 
FROM BORROW 
WHERE LOANNO%2  <> 0;



