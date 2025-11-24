USE  CSE_3A_164

CREATE TABLE EMP(
EID INT,
Ename VARCHAR(20),
Department VARCHAR(25),
Salary INT,
JoiningDate DATE,
City VARCHAR(20),
Gender VARCHAR(15)
);

INSERT INTO EMP VALUES(101, 'Rahul', 'Admin', 56000, '1990-Jan-01', 'Rajkot', 'Male'), 
(102, 'Hardik', 'IT', 18000, '1990-Sep-25', 'Ahmedabad', 'Male'), 
(103, 'Bhavin', 'HR', 25000, '1991-May-14', 'Baroda', 'Male'), 
(104, 'Bhoomi', 'Admin', 39000, '1991-Feb-08', 'Rajkot', 'Female'), 
(105, 'Rohit', 'IT', 17000, '1990-Jul-23', 'Jamnagar', 'Male'), 
(106, 'Priya', 'IT', 9000, '1990-Oct-18', 'Ahmedabad', 'Female'), 
(107, 'Bhoomi', 'HR', 34000, '1991-Dec-25', 'Rajkot', 'Female'); 

SELECT * FROM EMP


----Display the Highest, Lowest, Label the columns Maximum, Minimum respectively. 
SELECT MAX(SALARY) AS [MAXIMUM],
		MIN(SALARY) AS [MINIMUM]
		FROM EMP

----Display Total, and Average salary of all employees. Label the columns Total_Sal and Average_Sal, respectively. 

SELECT SUM(SALARY) AS TOTAL_SAL, 
AVG(SALARY) AS AVERAGE_SAL
FROM EMP

----Find total number of employees of EMPLOYEE table.

SELECT COUNT(EID) AS TOTAL_EMPLOYEE
FROM EMP

---Find highest salary from Rajkot city. 

SELECT MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE CITY='RAJKOT'

----Give maximum salary from IT department. 

SELECT MAX(SALARY) AS MAX_SALARY_IT
FROM EMP
WHERE Department='IT'


----- Count employee whose joining date is after 8-feb-91.

SELECT COUNT(EID) AS COUNT_EMP
FROM EMP
WHERE JoiningDate>'1991-02-08'

----Display average salary of Admin department. 

SELECT AVG(SALARY) AS AVG_SALARY
FROM EMP
WHERE Department='ADMIN'

---Display total salary of HR department. 

SELECT SUM(SALARY) AS [TOTAL_SALARY]
FROM EMP
WHERE Department='HR'

----Count total number of cities of employee without duplication.

SELECT COUNT(DISTINCT City) AS COUNT_CITY
FROM EMP;

----Count unique departments. 

SELECT COUNT(DISTINCT DEPARTMENT) AS [COUNT_DEPARTMENT]
FROM EMP

--Give minimum salary of employee who belongs to Ahmedabad. 

SELECT MIN(SALARY) AS [MIN_SALARY]
FROM EMP
WHERE CITY = 'AHMEDABAD'

--- Find city wise highest salary. 

SELECT CITY,MAX(SALARY) AS [MAX_CITY]
FROM EMP
GROUP BY CITY

--- Find department wise lowest salary. 

SELECT Department,MIN(SALARY) AS [MIN_DEPARTMENT]
FROM EMP
GROUP BY Department

---- Display city with the total number of employees belonging to each city.

SELECT CITY, COUNT(CITY) AS [COUNT_CITY]
FROM EMP
GROUP BY CITY

----Give total salary of each department of EMP table.

SELECT DEPARTMENT,SUM(SALARY) AS [TOTAL_SALARY]
FROM EMP
GROUP BY Department

--- Give average salary of each department of EMP table without displaying the respective department name.

SELECT AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY Department

---Count the number of employees for each department in every city.

SELECT CITY, DEPARTMENT, COUNT(EID) AS COUNT
FROM EMP
GROUP BY CITY, DEPARTMENT;

--- Calculate the total salary distributed to male and female employees. 

SELECT GENDER,SUM(SALARY) AS [TOTAL]
FROM EMP
GROUP BY GENDER

-- Give city wise maximum and minimum salary of female employees.

SELECT CITY, MAX(SALARY) AS MAX_SALARY,
MIN(SALARY) AS MIN_SALARY
FROM EMP
WHERE GENDER='FEMALE'
GROUP BY CITY

----Calculate department, city, and gender wise average salary. 

SELECT DEPARTMENT,CITY, GENDER, AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY DEPARTMENT,CITY, GENDER

---PART-B----

----Count the number of employees living in Rajkot. 

SELECT CITY,COUNT(EID) AS TOTAL
FROM EMP
WHERE CITY='RAJKOT'
GROUP BY CITY

----Display the difference between the highest and lowest salaries. Label the column DIFFERENCE.
SELECT MAX(SALARY) - MIN(SALARY) AS DIFFERENCE
FROM EMP;

---Display the total number of employees hired before 1st January, 1991. 

SELECT COUNT(*) AS TOTAL_EMPLOYEES
FROM EMP
WHERE JoiningDate < '1991-01-01';

----PART-C----

-----Count the number of employees living in Rajkot or Baroda. 

SELECT CITY, COUNT(EID) AS TOTAL
FROM EMP
WHERE CITY IN ('Rajkot', 'Baroda')
GROUP BY CITY;

----- Display the total number of employees hired before 1st January, 1991 in IT department.

SELECT COUNT(*) AS TOTAL
FROM EMP
WHERE JoiningDate < '1991-01-01' AND Department = 'IT';

---Find the Joining Date wise Total Salaries.

SELECT JOININGDATE, SUM(SALARY) AS TOTAL_SALARY
FROM EMP
GROUP BY JoiningDate

--- Find the Maximum salary department & city wise in which city name starts with ‘R’.

SELECT DEPARTMENT, CITY, MAX(SALARY) AS MAX_SALARY
FROM EMP
WHERE CITY LIKE 'R%'
GROUP BY DEPARTMENT, CITY

















