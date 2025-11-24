USE CSE_3A_164


CREATE TABLE STU_INFO(
    RNO INT ,
    NAME VARCHAR(30),
    BRANCH VARCHAR(5)
);


CREATE TABLE RESULT(
    RNO INT,
    SPI DECIMAL(8,2)
);



CREATE TABLE EMPLOYEE_MASTER(
    EMPLOYEENO VARCHAR(10),
    NAME VARCHAR(30),
    MANAGERNO VARCHAR(10) 
);

INSERT INTO EMPLOYEE_MASTER VALUES
('E01', 'Tarun', NULL), 
('E02', 'Rohan', 'E02'), 
('E03', 'Priya', 'E01'), 
('E04', 'Milan', 'E03'), 
('E05', 'Jay', 'E01'), 
('E06', 'Anjana', 'E04');

SELECT * FROM EMPLOYEE_MASTER

select * from STU_INFO

---Combine information from student and result table using cross join or Cartesian product.

SELECT * 
FROM 
STU_INFO , RESULT

----Perform inner join on Student and Result tables. 

SELECT *
FROM 
STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

---Perform the left outer join on Student and Result tables. 

SELECT *
FROM 
STU_INFO LEFT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

---Perform the right outer join on Student and Result tables. 
SELECT *
FROM 
STU_INFO RIGHT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--- Perform the full outer join on Student and Result tables. 

SELECT *
FROM 
STU_INFO FULL OUTER JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

---Display Rno, Name, Branch and SPI of all students.
---roll no is null and branch ce or no match in second table
SELECT 
STU_INFO.RNO,NAME,BRANCH,SPI
FROM
STU_INFO LEFT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO

--- Display Rno, Name, Branch and SPI of CE branch’s student only. 

SELECT 
STU_INFO.RNO,NAME,BRANCH,SPI
FROM
STU_INFO LEFT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE BRANCH='CE'

--Display Rno, Name, Branch and SPI of other than EC branch’s student only.

SELECT 
STU_INFO.RNO,NAME,BRANCH,SPI
FROM
STU_INFO LEFT JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE BRANCH!='EC'

---Display average result of each branch.

SELECT BRANCH,AVG(SPI) AS RESULT
FROM
STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH


--- Display average result of CE and ME branch. 


SELECT BRANCH,AVG(SPI) AS RESULT
FROM
STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
WHERE BRANCH IN('CE','ME')
GROUP BY BRANCH

--- Display Maximum and Minimum SPI of each branch.

SELECT BRANCH, MAX(SPI) AS [MAX_SPI],MIN(SPI) AS [MIN_SPI]
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH

---Display branch wise student’s count in descending order. 

SELECT BRANCH,COUNT(STU_INFO.RNO) AS STUDENT_COUNT
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH
ORDER BY STUDENT_COUNT DESC

-----PART-B----------

---Display average result of each branch and sort them in ascending order by SPI. 
SELECT BRANCH, AVG(SPI) AS AVERAGE_RESULT
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH
ORDER BY AVERAGE_RESULT

----Display highest SPI from each branch and sort them in descending order. 

SELECT MAX(SPI) AS HIGHEST_SPI, BRANCH
FROM STU_INFO JOIN RESULT
ON STU_INFO.RNO = RESULT.RNO
GROUP BY BRANCH
ORDER BY HIGHEST_SPI DESC

----PART-C----------

---- Retrieve the names of employee along with their manager’s name from the Employee table.

	SELECT E.NAME AS EMPLOYEE, M.NAME AS MANAGER
	FROM EMPLOYEE_MASTER E JOIN EMPLOYEE_MASTER M
	ON E.MANAGERNO = M.EMPLOYEENO





















