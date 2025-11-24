USE CSE_3A_164


CREATE TABLE STUDENT_INFO(
RNO INT,
NAME VARCHAR(20),
BRANCH VARCHAR(5),
SPI DECIMAL(8,2),
BKLOG INT
);

INSERT INTO STUDENT_INFO 
VALUES
(101, 'Raju', 'CE', 8.80, 0), 
(102, 'Amit', 'CE', 2.20, 3), 
(103, 'Sanjay', 'ME', 1.50, 6), 
(104, 'Neha', 'EC', 7.65, 1), 
(105, 'Meera', 'EE', 5.52, 2), 
(106, 'Mahesh', 'EC', 4.50, 3);



---Create a view Personal with all columns. 

CREATE VIEW PERSONAL AS
SELECT * FROM STUDENT_INFO;

SELECT * FROM PERSONAL;


----Create a view Student_Details having columns Name, Branch & SPI. 

CREATE VIEW STUDENT_DETAILS
AS
SELECT NAME,BRANCH,SPI FROM STUDENT_INFO

SELECT * FROM STUDENT_DETAILS

--- Create a view AcademicData having columns RNo, Name, Branch.

CREATE VIEW ACADEMICDATA
AS 
SELECT RNO,NAME,BRANCH FROM STUDENT_INFO

SELECT * FROM ACADEMICDATA

----Create a view Student_ bklog having all columns but students whose bklog more than 2.

CREATE VIEW STUDENT_BKLOG
AS 
SELECT * FROM STUDENT_INFO
WHERE BKLOG > 2

SELECT * FROM STUDENT_BKLOG

---Create a view Student_Pattern having RNo, Name & Branch columns in which Name consists of four letters. 

CREATE VIEW STUDENT_PATTERN
AS 
SELECT RNO,NAME,BRANCH FROM STUDENT_INFO
WHERE NAME LIKE '____'

SELECT * FROM STUDENT_PATTERN

----Insert a new record to AcademicData view. (107, Meet, ME) 

INSERT INTO ACAEDEMICDATA VALUES
(107,'MEET','ME');

SELECT * FROM ACAEDEMICDATA

---Update the branch of Amit from CE to ME in Student_Details view. 

UPDATE STUDENT_DETAILS
SET BRANCH='ME'
WHERE BRANCH='CE' AND NAME='AMIT'

SELECT * FROM STUDENT_DETAILS

----Delete a student whose roll number is 104 from AcademicData view.

DELETE FROM ACAEDEMICDATA
WHERE RNO=104

SELECT * FROM ACAEDEMICDATA

----Create view for the student whose name starts with M and ends with a, having SPI more than 6 and backlog less than 2. 

CREATE VIEW CONDITIONAL
AS SELECT NAME,SPI,BKLOG FROM STUDENT_INFO
WHERE NAME LIKE 'M%A' AND SPI>6 AND BKLOG<2

SELECT * FROM CONDITIONAL

---Create the view for the students whose name contains vowel. 

CREATE VIEW VOWELS
AS SELECT NAME FROM STUDENT_INFO
WHERE NAME LIKE '%[A,E,I,O,U]%'

SELECT * FROM VOWELS

-----PART-B-----

---Create a view that displays information of all students whose SPI is above 8.5

CREATE VIEW DISPLAY
AS SELECT * FROM STUDENT_INFO
WHERE SPI>8.5

SELECT * FROM DISPLAY

----Create a view that displays 0 backlog students. 

CREATE VIEW BACKLOG
AS SELECT * FROM STUDENT_INFO
WHERE BKLOG=0

SELECT * FROM BACKLOG

---Create a view Computerview that displays CE branch data only.

CREATE VIEW COMPUTERVIEW
AS SELECT * FROM STUDENT_INFO
WHERE BRANCH='CE'

SELECT * FROM COMPUTERVIEW

-------PART-C---------


----Create a view Result_EC that displays the name and SPI of students with SPI less than 5 of branch EC.

CREATE VIEW RESULT_EC
AS SELECT NAME,SPI FROM STUDENT_INFO
WHERE SPI<5 AND BRANCH='EC'

SELECT * FROM RESULT_EC

-----Update the result of student MAHESH to 4.90 in Result_EC view. 


UPDATE RESULT_EC
SET SPI = 4.9
WHERE NAME='MAHESH'

SELECT * FROM RESULT_EC

--- Create a view Stu_Bklog with RNo, Name and Bklog columns in which name starts with ‘M’ and having bklogs more than 5. 

CREATE VIEW STU_BKLOG
AS SELECT RNO,NAME,BKLOG
FROM STUDENT_INFO
WHERE NAME LIKE 'M%' AND BKLOG>5

SELECT * FROM STU_BKLOG

----Drop Computerview form the database. 

DROP VIEW COMPUTERVIEW












