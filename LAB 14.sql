--------PART-A---------

---SUBQUERY NO JOIN


-----Display details of students who are from computer department. 

SELECT *
FROM Student_Data
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'Computer'
);

-----Displays name of students whose SPI is more than 8. 

SELECT NAME 
FROM Student_Data
WHERE RNO IN (
	SELECT RNO
	FROM Acaedemic
	WHERE SPI>8
);

-----Display details of students of computer department who belongs to Rajkot city. 

SELECT *
FROM Student_Data
WHERE CITY='RAJKOT' AND DepartmentID IN (
	SELECT DEPARTMENTID
	FROM Department
	WHERE DepartmentName='COMPUTER'
);

----Find total number of students of electrical department. 

SELECT COUNT(RNO) AS TOTAL_STUDENTS
FROM Student_Data
WHERE DepartmentID IN (
	SELECT DEPARTMENTID
	FROM Department
	WHERE DepartmentName='ELECTRICAL'	
);


-----Display name of student who is having maximum SPI. 

SELECT Name
FROM Student_Data
WHERE RNO = (
    SELECT RNO
    FROM Acaedemic
    WHERE SPI = (SELECT MAX(SPI) FROM Acaedemic)
);

----Display details of students having more than 1 backlog. 

SELECT *
FROM Student_Data
WHERE RNO IN (
	SELECT RNO
    FROM Acaedemic
	WHERE Bklog>1
);

------PART-B------

-----Display name of students who are either from computer department or from mechanical department.

SELECT NAME
FROM Student_Data
WHERE DepartmentID IN (
	SELECT DepartmentID
	FROM Department
	WHERE DepartmentName IN ('COMPUTER','MECHANICAL') 
);


-----Display name of students who are in same department as 102 studying in. (IMPPPPPPP)

SELECT NAME
FROM Student_Data
WHERE DepartmentID IN (
	SELECT DepartmentID
	FROM Student_Data
	WHERE RNO=102
);


------PART-C-------

----- Display name of students whose SPI is more than 9 and who is from electrical department.

SELECT Name
FROM Student_Data
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Department
    WHERE DepartmentName = 'Electrical'
)
AND Rno IN (
    SELECT Rno
    FROM Acaedemic
    WHERE SPI > 9
);

-----Display name of student who is having second highest SPI. (IMPPPPPP)

SELECT Name
FROM Student_Data 
WHERE Rno = (
    SELECT Rno
    FROM Acaedemic
    WHERE SPI = (
        SELECT MAX(SPI)
        FROM Acaedemic
        WHERE SPI < (SELECT MAX(SPI) FROM Acaedemic)
    )
);


-----Display city names whose students SPI is 9.2 

SELECT CITY
FROM Student_Data
WHERE RNO IN (
	SELECT RNO
	FROM Acaedemic
	WHERE SPI=9.2
)

-----Find the names of students who have more than the average number of backlogs across all students. (IMPPPP)

SELECT Name 
FROM Student_Data
WHERE RNO IN (
    SELECT RNO
    FROM Acaedemic
    WHERE Bklog > (SELECT AVG(Bklog) FROM Acaedemic)
);


------Display the names of students who are in the same department as the student with the highest SPI.(IMPPPP)
SELECT Name
FROM Student_Data
WHERE DepartmentID = (
    SELECT DepartmentID
    FROM Student_Data
    WHERE Rno = (
        SELECT Rno
        FROM Acaedemic
        WHERE SPI = (SELECT MAX(SPI) FROM Acaedemic)
    )
) AND RNO!= (SELECT RNO FROM Acaedemic WHERE SPI=(SELECT MAX(SPI) FROM ACAEDEMIC));



--------SET OPERATORS-----------

--------PART-A--------


------Display name of students who is either in Computer or in Electrical. 

SELECT NAME FROM COMPUTER
UNION
SELECT NAME FROM ELECTRICAL

------Display name of students who is either in Computer or in Electrical including duplicate data. 

SELECT NAME FROM COMPUTER
UNION ALL
SELECT NAME FROM ELECTRICAL


-----Display name of students who is in both Computer and Electrical. 
SELECT NAME FROM COMPUTER
INTERSECT
SELECT NAME FROM ELECTRICAL

---- Display name of students who are in Computer but not in Electrical. 

SELECT NAME FROM COMPUTER
EXCEPT
SELECT NAME FROM ELECTRICAL

-----Display name of students who are in Electrical but not in Computer.

SELECT NAME FROM ELECTRICAL
EXCEPT
SELECT NAME FROM COMPUTER

-----Display all the details of students who are either in Computer or in Electrical.

SELECT * FROM COMPUTER
UNION
SELECT * FROM ELECTRICAL

(SELECT * FROM ELECTRICAL
EXCEPT
SELECT * FROM COMPUTER)
UNION
(SELECT * FROM COMPUTER
EXCEPT
SELECT * FROM ELECTRICAL)

----Display all the details of students who are in both Computer and Electrical. 

SELECT * FROM COMPUTER
INTERSECT
SELECT * FROM ELECTRICAL

----part-b----

-------Display name of persons who is either Employee or Customer. 

SELECT NAME FROM EMP_DATA
UNION
SELECT NAME FROM CUSTOMER_SET

-----Display name of persons who is either Employee or Customer including duplicate data.
SELECT NAME FROM EMP_DATA
UNION ALL
SELECT NAME FROM CUSTOMER_SET

----Display name of persons who is both Employee as well as Customer.

SELECT NAME FROM EMP_DATA
INTERSECT
SELECT NAME FROM CUSTOMER_SET

-----Display name of persons who are Employee but not Customer.

SELECT NAME FROM EMP_DATA
EXCEPT
SELECT NAME FROM CUSTOMER_SET

-----Display name of persons who are Customer but not Employee.

SELECT NAME FROM CUSTOMER_SET
EXCEPT
SELECT NAME FROM EMP_DATA


------PART-C------

SELECT EID,NAME FROM EMP_DATA
UNION
SELECT CID,NAME FROM CUSTOMER_SET

SELECT EID,NAME FROM EMP_DATA
UNION ALL
SELECT CID,NAME FROM CUSTOMER_SET


SELECT EID,NAME FROM EMP_DATA
INTERSECT
SELECT CID,NAME FROM CUSTOMER_SET


SELECT EID,NAME FROM EMP_DATA
EXCEPT
SELECT CID,NAME FROM CUSTOMER_SET


SELECT CID,NAME FROM CUSTOMER_SET
EXCEPT
SELECT EID,NAME FROM EMP_DATA












