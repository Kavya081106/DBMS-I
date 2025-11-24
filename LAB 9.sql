USE CSE_3A_164

---Display the result of 5 multiply by 30. 

SELECT 5*30 AS RESULT

---Find out the absolute value of -25, 25, -50 and 50.

SELECT ABS(-25) AS ABS_VAL1
		,ABS(25)  AS ABS_VAL2
		,ABS(-50) AS ABS_VAL3
		,ABS(50) AS ABS_VAL4

---Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2. 

SELECT 
    CEILING(25.2)   AS Result1,
    CEILING(25.7)   AS Result2,
    CEILING(-25.2)  AS Result3;

---Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.

SELECT 
    FLOOR(25.2)   AS Result1,
    FLOOR(25.7)   AS Result2,
    FLOOR(-25.2)  AS Result3;

---- Find out remainder of 5 divided 2 and 5 divided by 3. 

SELECT 5%2 AS Result1,
		5%3 AS Result2

----Find out value of 3 raised to 2nd power and 4 raised 3rd power. 

SELECT POWER(3,2) AS Pow1,
		POWER(4,3) AS Pow2

----Find out the square root of 25, 30 and 50. 

SELECT SQRT(25) AS SQT1,
		SQRT(30) AS SQT2,
		SQRT(50) AS SQT3

----Find out the square of 5, 15, and 25. 

SELECT SQUARE(5) AS SQ1,
		SQUARE(15) AS SQ2,
		SQUARE(25) AS SQ3

---Find out the value of PI.

SELECT PI()

----Find out round value of 157.732 for 2, 0 and -2 decimal points.

SELECT ROUND(157.732,2) AS R1,
		ROUND(157.732,0) AS R2,
		ROUND(157.732,-2) AS R3

---- Find out exponential value of 2 and 3. 

SELECT EXP(2) AS EX1,
EXP(3) AS EX2

---. Find out logarithm having base e of 10 and 2. 

SELECT LOG(10) AS LN10,
LOG(2) AS LN2

----- Find out logarithm having base b having value 10 of 5 and 100. 

SELECT 
    LOG(5) / LOG(10) AS BS1,
    LOG(100) / LOG(10) AS BS2;

----- Find sine, cosine and tangent of 3.1415. (WE GOT ANS HERE IN RADIANS)
SELECT SIN(3.1415) AS SINE,
COS(3.1415) AS COSINE,
TAN(3.1415) AS TANGENT


--DEGREE
SELECT 
    SIN(RADIANS(3.1415)) AS SINE,
    COS(RADIANS(3.1415)) AS COSINE,
    TAN(RADIANS(3.1415)) AS TANGENT;


--- Find sign of -25, 0 and 25.

SELECT 
    SIGN(-25) AS Sign1,
    SIGN(0)   AS Sign2,
    SIGN(25)  AS Sign3;

--- Generate random number using function. 

SELECT RAND() AS RandomNumber

-------PART-B------
drop table EMP_MASTER
CREATE TABLE EMP_MASTER(
		EmpNo INT,
		EmpName VARCHAR(30),
		JoiningDate DATE,
		Salary DECIMAL(8,2),
		Commission INT,
		City VARCHAR(20),
		Dept_Code VARCHAR(10)
);


INSERT INTO EMP_MASTER VALUES
(101, 'Keyur','2002-01-05', 12000.00, 4500, 'Rajkot', '3@g'), 
(102, 'Hardi','2004-02-15', 14000.00, 2500, 'Ahmedabad', '3@'), 
(103, 'Kajal','2006-03-14', 15000.00, 3000, 'Baroda', '3-GD'), 
(104, 'Bhoomi','2005-06-23', 12500.00, 1000, 'Ahmedabad', '1A3D'),
(105, 'Harmi','2004-02-15',14000.00, 2000, 'Rajkot', '312A');

SELECT * FROM EMP_MASTER

---Display the result of Salary plus Commission.
SELECT SALARY+COMMISSION AS TOTAL
FROM EMP_MASTER

----Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.

SELECT 
    CEILING(55.2)   AS Result1,
    CEILING(35.7)   AS Result2,
    CEILING(-55.2)  AS Result3;

---Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2.

SELECT 
	FLOOR(55.2) AS Result1,
	FLOOR(35.7) AS Result2,
	FLOOR(-55.2) AS Result3;

---Find out remainder of 55 divided 2 and 55 divided by 3. 

SELECT 55%2 AS MOD1,
	55%3 AS MOD2;

----Find out value of 23 raised to 2nd power and 14 raised 3rd power.

SELECT POWER(23,2) AS POW1,
	POWER(14,3) AS POW2


-------PART-C--------

----Retrieve the details of employees whose total earnings (Salary + Commission) are greater than 15000.

SELECT *
FROM EMP_MASTER
WHERE Salary+Commission>15000

---- Find the details of employees whose commission is more than 25% of their salary. 

SELECT * 
FROM EMP_MASTER
WHERE Commission>0.25*SALARY

----List the employees who joined before 2005 and whose total earnings (Salary + Commission) are greater than 15000. 
SELECT EMPNAME 
FROM EMP_MASTER
WHERE (JoiningDate<'2005') AND (Salary+Commission>15000)

----Find employees whose total earnings (Salary + Commission) are at least double their salary. 

SELECT EMPNAME
FROM EMP_MASTER
WHERE (Salary+Commission)>=(2*SALARY)

------String functions-----------

-------PART-A------

---- Find the length of following. (I) NULL    (II) ‘   hello     ’   (III)  Blank
SELECT 
    LEN(NULL) AS Length_NULL,
    LEN('   hello     ') AS Length_Hello_With_Spaces,
    LEN('') AS Length_Empty_String

---- Display your name in lower & upper case. 

SELECT LOWER(EMPNAME) AS LC,
UPPER(EMPNAME) AS UC
FROM  EMP_MASTER

SELECT LOWER('KAVYA') AS LC,
UPPER('KAVYA') AS UC


----Display first three characters of your name.

SELECT LEFT(EMPNAME,3) AS CHARACTER3
FROM EMP_MASTER

SELECT LEFT('KAVYA',3) AS CHARACTER3

---- Display 3rd to 10th character of your name. (3 AND 10 INCLUSIVE)

SELECT SUBSTRING(EMPNAME,3,10) AS SUB
FROM EMP_MASTER

SELECT SUBSTRING('KAVYA_VYAS',3,10) AS SUB

----Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE. 

SELECT REPLACE('abc123efg','123','XYZ') AS REPLACED1,
REPLACE('abcabcabc','C','5') AS REPLACED2

----Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.

SELECT ASCII('a') as A1,
ASCII('A') as A2,
ASCII('z') as A3,
ASCII('Z') as A4,
ASCII(0) as A5,
ASCII(9) as A6

----Write a query to display character based on number 97, 65,122,90,48,57. 

SELECT CHAR(97) AS C1,
CHAR(65) AS C2,
CHAR(122) AS C3,
CHAR(90) AS C4,
CHAR(48) AS C5,
CHAR(57) AS C6

----Write a query to remove spaces from left of a given string ‘ hello world  ‘. 

SELECT LTRIM( ' hello world  ') AS LEFTTRIM

----Write a query to remove spaces from right of a given string ' hello world  '. 
SELECT RTRIM( ' hello world  ') AS RIGHTTTRIM

---- Write a query to display first 4 & Last 5 characters of ‘SQL Server’.
SELECT LEFT('SQL SERVER',4) AS FIRST4,
RIGHT('SQL SERVER',5) AS LAST5

---- Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).

SELECT CAST(1234.56 AS INT) AS CAST_NUMBER
SELECT CONVERT(INT,1234.56) AS CONVERT_NUMBER

----Write a query to convert a float 10.58 to integer (Use cast and convert function).
SELECT CAST(10.58 AS INT) AS CAST_NUMBER
SELECT CONVERT(INT,10.58) AS CONVERT_NUMBER

----Put 10 space before your name using function. 

SELECT SPACE(10)+ 'KAVYA'  AS USE_SPACE

---- Combine two strings using + sign as well as CONCAT (). 

SELECT CONCAT('DARSHAN', 'UNI') AS CONCATING

SELECT 'DARSHAN'+'UNI' AS CONCAT_PLUS

---- Find reverse of “Darshan”. 

SELECT REVERSE('Darshan') AS REVERSED

---Repeat your name 3 times. 
SELECT REPLICATE('Kavya',3)

---------part-b------------

----- Find the length of EMP Name and City columns. 
SELECT EMPNAME,LEN(EMPNAME) AS LENGTH_NAME,
CITY,LEN(CITY) AS LENGTH_CITY
FROM EMP_MASTER

---- Display EMP Name and City columns in lower & upper case.

SELECT UPPER(EMPNAME) AS UPPER_NAME, LOWER(EMPNAME) AS LOWER_NAME,
UPPER(CITY) AS UPPER_CITY,LOWER(CITY) AS LOWER_CITY
FROM EMP_MASTER

-----Display first three characters of EMP Name column.
SELECT LEFT(EMPNAME,3) AS FIRST3
FROM EMP_MASTER

----Display 3rd to 10th character of city column. 
SELECT SUBSTRING(CITY,3,10) AS SUB
FROM EMP_MASTER

---- Write a query to display first 4 & Last 5 characters of EMP Name column. 

SELECT LEFT(EMPNAME,4) AS FIRST4,
RIGHT(EMPNAME,5) AS LAST5
FROM EMP_MASTER

------PART-C------

----Put 10 space before EMP Name using function. 

SELECT SPACE(10)+EMPNAME
FROM EMP_MASTER

----Combine EMP Name and city columns using + sign as well as CONCAT (). 

SELECT CONCAT(EMPNAME,' ',CITY) AS CONCATED
FROM EMP_MASTER

----Combine all columns using + sign as well as CONCAT (). 

SELECT CONCAT_WS(' ',EmpNo, EmpName, JoiningDate, Salary, Commission, City, Dept_Code) AS CONCATED
FROM EMP_MASTER

SELECT ((CAST(EmpNo AS VARCHAR)+ EmpName+ CAST(JoiningDate as varchar)+CAST(Salary AS VARCHAR) + CAST(Commission AS VARCHAR)+ City+ Dept_Code))
 ASCONCATEDPLUS FROM EMP_MASTER

-----Combine the result as < EMP Name > Lives in <City>.

SELECT EMPNAME+' '+'Lives in '+CITY
FROM EMP_MASTER

---- Combine the result as ‘EMP no of < EMP Name> is <EmpNo> . 

SELECT 'Emp No of '+EMPNAME+' is '+ CAST(EMPNO AS VARCHAR)
FROM EMP_MASTER

-----Retrieve the names of all employee where the third character of the Name is a vowel. 
SELECT EMPNAME FROM EMP_MASTER
WHERE SUBSTRING(EMPNAME,3,1) IN ('A','E','I','O','U')


---- Concatenate the name and city of students who have a name that ends with the letter 'r' and a city that 
----starts with 'R'.

select CONCAT_WS(' ',EMPNAME,CITY) AS NAME_CITY
FROM EMP_MASTER
WHERE RIGHT(EMPNAME,1)='r' AND
LEFT(CITY,1)='R' 


-----Date Functions 

-----PART-A------

-----Write a query to display the current date & time. Label the column Today_Date.

SELECT GETDATE() AS Today_Date 

----Write a query to find new date after 365 day with reference to today. 

SELECT DATEADD(YY,1,GETDATE()) AS YEAR_1_LATER

---Display the current date in a format that appears as may 5 1994 12:00AM.

SELECT CONVERT(VARCHAR, GETDATE(), 100) AS FormattedDate

---Display the current date in a format that appears as 03 Jan 1995.

SELECT FORMAT(GETDATE(), 'dd MMM yyyy') AS FormattedDate

---Display the current date in a format that appears as Jan 04, 96.

SELECT FORMAT(GETDATE(),'MMM dd, yy') AS FormattedDate

---Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09. 

SELECT DATEDIFF(MONTH, '2008-12-31', '2009-03-31') AS TotalMonths;


---Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR, '2012-01-25 7:00', '2012-01-26 10:30') AS TotalHours;

---Write a query to extract Day, Month, Year from given date 12-May-16. 

SELECT 
  DAY('2016-05-12') AS DayPart, 
  MONTH('2016-05-12') AS MonthPart, 
  YEAR('2016-05-12') AS YearPart;

--- Write a query that adds 5 years to current date. 

SELECT DATEADD(YEAR,5,GETDATE()) AS [5_YEAR_AFTER]

--Write a query to subtract 2 months from current date
SELECT DATEADD(MONTH, -2, GETDATE()) AS [2_MONTH_BEFORE];

--- Extract month from current date using datename () and datepart () function. 

SELECT DATENAME(MONTH,GETDATE()) AS [DATENAME],
DATEPART(MONTH,GETDATE()) AS [DATEPART]

--- Write a query to find out last date of current month. 

SELECT  
EOMONTH(GETDATE()) as 'End Of Current Month'

---Calculate your age in years and months. 

SELECT 
  DATEDIFF(YEAR, '2006-11-08', GETDATE()) AS [Years],
  DATEDIFF(MONTH, '2006-11-08', GETDATE()) % 12 AS [Months];


/*SELECT 
DATEDIFF(YEAR, '2006-11-08', GETDATE()) 
    CASE WHEN (MONTH(GETDATE()) < 11) 
             OR (MONTH(GETDATE()) = 11 AND DAY(GETDATE()) < 8) 
      THEN 1 ELSE 0 END AS [Years],

  (DATEDIFF(MONTH, '2006-11-08', GETDATE()) % 12) AS [Months];*/



---PART-B-----

---Write a query to find new date after 365 days with reference to JoiningDate. 

SELECT DATEADD(DAY,365,JOININGDATE) AS 'NEWDATE'
from EMP_MASTER

---Write a query to find out total number of months between JoiningDate and 31-Mar-09.

SELECT DATEDIFF(MONTH,JOININGDATE,'2009-03-31') AS 'TOTAL MONTHS'
FROM EMP_MASTER

---Write a query to find out total number of years between JoiningDate and 14-Sep-10.

SELECT DATEDIFF(YEAR,JOININGDATE,'2010-09-14') AS 'TOTAL YEARS'
FROM EMP_MASTER

---PART-C-------

---Write a query to extract Day, Month, Year from JoiningDate.

---RETURNS DATENAME
SELECT DATENAME(DAY,JOININGDATE) AS 'DAY',
DATENAME(MONTH,JOININGDATE) AS 'MONTH',
DATENAME(YEAR,JOININGDATE) AS 'YEAR'
FROM EMP_MASTER

--RETURNS NUMBERS
SELECT 
    DAY(JoiningDate) AS [Day],
    MONTH(JoiningDate) AS [Month],
    YEAR(JoiningDate) AS [Year]
FROM EMP_MASTER;

--Write a query that adds 5 years to JoiningDate

SELECT DATEADD(YEAR,5,JOININGDATE)
AS '5_YEARS_AFTER'
FROM EMP_MASTER

---Write a query to subtract 2 months from JoiningDate. (IMPPPP)

SELECT 
    DATEADD(MONTH, -2, JoiningDate) AS [2_MONTH_BEFORE]
FROM 
    EMP_MASTER;

--Extract month from JoiningDate using datename () and datepart () function. 

SELECT DATENAME(MONTH,JOININGDATE) AS [DATENAME],
DATEPART(MONTH,JOININGDATE) AS [DATEPART]
FROM EMP_MASTER

---Select employee who joined between the 1st and 15th of any month in any year. 

SELECT * 
FROM EMP_MASTER
WHERE DAY(JoiningDate) BETWEEN 1 AND 15;

---Find employee whose JoiningDate is the last day of any month. 

SELECT *
FROM EMP_MASTER
WHERE JoiningDate = EOMONTH(JoiningDate);

---List employee whose JoiningDate is during a leap year.

SELECT *
FROM EMP_MASTER
WHERE 
    (YEAR(JoiningDate) % 400 = 0) 
    OR (YEAR(JoiningDate) % 4 = 0 AND YEAR(JoiningDate) % 100 != 0);























    











