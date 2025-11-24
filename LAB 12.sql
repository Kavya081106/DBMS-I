SELECT * FROM DEPT

SELECT * FROM PERSON

---SOMETHING NULL THEN LEFT JOIN AND RIGHT JOIN(CHECK REFERENCE FROM BOOKS)


----Combine information from Person and Department table using cross join or Cartesian product.

SELECT * FROM
DEPT,PERSON

---Find all persons with their department name 

SELECT PERSONNAME,DEPARTMENTNAME
FROM PERSON LEFT JOIN DEPT 
ON PERSON.DepartmentID = DEPT.DepartmentID

---Find all persons with their department name & code. 
SELECT PERSONNAME,DEPARTMENTNAME,DepartmentCode
FROM PERSON JOIN DEPT 
ON PERSON.DepartmentID = DEPT.DepartmentID

---Find all persons with their department code and location. 
SELECT PERSONNAME,DepartmentCode,Location
FROM PERSON JOIN DEPT 
ON PERSON.DepartmentID = DEPT.DepartmentID

---Find the detail of the person who belongs to Mechanical department. 

SELECT PERSONNAME,DepartmentName
FROM DEPT JOIN PERSON
ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName='Mechanical'

----Final person’s name, department code and salary who lives in Ahmedabad city. 

SELECT PersonName,DepartmentCode,Salary 
FROM DEPT JOIN PERSON
ON PERSON.DepartmentID = DEPT.DepartmentID 
WHERE CITY='Ahmedabad'

---Find the person's name whose department is in C-Block. 

SELECT PersonName,DepartmentName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID 
WHERE Location='C-BLOCK'

---Retrieve person name, salary & department name who belongs to Jamnagar city. 
SELECT PersonName,DepartmentName,SALARY
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID 
WHERE CITY='JAMNAGAR'

----Retrieve person’s detail who joined the Civil department after 1-Aug-2001. 

SELECT PersonName,DepartmentName
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID 
WHERE DepartmentName='CIVIL' AND JoiningDate>'2001-08-01'

---Display all the person's name with the department whose joining date difference with the current date 
---is more than 365 days. 

SELECT PersonName, DepartmentName
FROM PERSON JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DATEDIFF(DAY, JoiningDate, GETDATE()) > 365



----Find department wise person counts. 

SELECT DepartmentName,COUNT(PERSONID) AS PERSON_COUNT
FROM PERSON JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DepartmentName

-----Give department wise maximum & minimum salary with department name.

SELECT DEPARTMENTNAME,MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM PERSON JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DepartmentName


---Find city wise total, average, maximum and minimum salary. 

SELECT CITY,SUM(SALARY) AS TOTAL_SALARY,MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY
FROM PERSON JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY CITY

-----Find the average salary of a person who belongs to Ahmedabad city. 

SELECT AVG(Salary) AS AVERAGE_SALARY
FROM PERSON
WHERE City = 'Ahmedabad';


----Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column) 
SELECT PERSONNAME+' LIVES IN '+CITY+' AND WORKS IN '+DEPARTMENTNAME+' DEPARTMENT' AS OUTPUT
FROM PERSON JOIN DEPT
    ON PERSON.DepartmentID = DEPT.DepartmentID


------PART-B-----

---Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column) 

SELECT PersonName + ' EARNS ' + CAST(Salary AS VARCHAR) 
       + ' FROM ' + DepartmentName + ' DEPARTMENT MONTHLY' AS OUTPUT
FROM PERSON
JOIN DEPT ON PERSON.DepartmentID = DEPT.DepartmentID;

-----Find city & department wise total, average & maximum salaries. 

SELECT DepartmentName,City,sum(salary) as Total_salary, avg(salary) as Average_Salary, max(salary) as Max_salary
from Dept join Person
ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DEPARTMENTNAME,CITY

----Find all persons who do not belong to any department.
SELECT p.*
FROM Person p
LEFT JOIN Dept d
    ON p.DepartmentID = d.DepartmentID
WHERE d.DepartmentID IS NULL;

----Find all departments whose total salary is exceeding 100000.

SELECT d.DepartmentID, 
       d.DepartmentName, 
       SUM(p.Salary) AS TotalSalary
FROM Dept d
LEFT JOIN Person p 
    ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName
HAVING SUM(p.Salary) > 100000;


----PART-C----

----List all departments who have no person. 
SELECT d.*
FROM Person p
RIGHT JOIN Dept d
    ON p.DepartmentID = d.DepartmentID
WHERE p.PersonID IS NULL


----List out department names in which more than two persons are working. 

SELECT DEPARTMENTNAME,COUNT(PERSONID) AS [COUNT]
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID
GROUP BY DepartmentName
HAVING COUNT(PERSONID)>2

----Give a 10% increment in the computer department employee’s salary. (Use Update) 

UPDATE PERSON 
SET SALARY=SALARY+SALARY*0.1
FROM PERSON JOIN DEPT
ON PERSON.DepartmentID = DEPT.DepartmentID
WHERE DepartmentName='COMPUTER'

SELECT * FROM PERSON
















