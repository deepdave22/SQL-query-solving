CREATE DATABASE college;

USE college;

CREATE TABLE student(
rollno INT PRIMARY KEY,
name VARCHAR(50),
marks INT NOT NULL,
grade VARCHAR(1),
city VARCHAR(20)
);

INSERT INTO student
(rollno,name,marks,grade,city)
VALUES
(101,"anil",78,"C","Pune"),
(102,"bhumika",93,"A","Mumbai"),
(103,"chetan",85,"B","Mumbai"),
(104,"dhruv",96,"A","Delhi"),
(105,"emanuel",12,"F","Delhi"),
(106,"farah",82,"B","Delhi");

SELECT * from student;

SELECT DISTINCT city FROM student;

SELECT * 
FROM student
 WHERE marks>80;
 
 SELECT * 
 FROM student 
 WHERE city = "Mumbai";
 
  SELECT * 
 FROM student 
 WHERE city = "Delhi" AND marks>90;
 
 SELECT * 
 FROM student
 LIMIT 3 offset 2;

SELECT * 
FROM student
ORDER BY city ASC;

SELECT * 
FROM student
ORDER BY marks ASC
LIMIT 3 offset 1;

SELECT COUNT(rollno)
FROM student;

SELECT city, count(name)
FROM student
GROUP BY city;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY city ASC;

SELECT city, avg(marks)
FROM student
GROUP BY city
ORDER BY avg(marks) DESC;

SELECT grade,count(rollno)
FROM student
GROUP BY grade
ORDER BY grade;

SELECT city, count(rollno)
FROM student
GROUP BY city
HAVING max(marks) > 90;


SELECT city
FROM student
WHERE grade = "O"
GROUP BY city
HAVING max(marks) >= 90
ORDER BY city DESC;

UPDATE student
SET grade = "O"
WHERE grade = "A";

SET SQL_SAFE_UPDATES=0;

SELECT * FROM student;

UPDATE student
SET marks = marks + 1;

UPDATE student
SET marks = 12
WHERE rollno = 105;

DELETE FROM student
WHERE marks < 33;


SELECT * FROM student;

CREATE TABLE dept(
id INT PRIMARY KEY,
name VARCHAR(50)
);

DROP TABLE teacher;

CREATE TABLE teacher(
id INT PRIMARY KEY,
name VARCHAR(50),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES dept(id)
ON UPDATE CASCADE
ON DELETE CASCADE
);

INSERT INTO dept
VALUES
(101,'english'),
(102,'IT');

INSERT INTO teacher
VALUES
(101,"Adam",101),
(102,"Eve",102);

select * from teacher;

UPDATE dept 
SET id=103
WHERE id = 102;

SELECT * FROM course;

CREATE TABLE stud(
id INT PRIMARY KEY,
name VARCHAR(50)
);

INSERT INTO stud (id,name)
VALUES
(101,"adam"),
(102,"bob"),
(103,"casey");

CREATE TABLE course(
id INT PRIMARY KEY,
course VARCHAR(50)
);

INSERT INTO course(id,course)
VALUES
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science")

SELECT * 
FROM stud
INNER JOIN course
ON stud.id = course.id;

CREATE TABLE test_storage (
    id INT PRIMARY KEY AUTO_INCREMENT,
    col_int INT NULL,
    col_varchar VARCHAR(50) NULL
);

INSERT INTO test_storage (col_int, col_varchar) VALUES
(NULL, NULL),          -- both NULL
(0, ''),               -- 0 in INT, empty string in VARCHAR
(123, 'hello');        -- normal values

-- See the storage used
SELECT id, col_int, col_varchar, LENGTH(col_varchar) AS str_length
FROM test_storage;

CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(50),
manager_id INT
);

INSERT INTO employee (id,name,manager_id) 
VALUES
(101,"adam",103),
(102,"bob",104),
(103,"casey",NULL),
(104,"donald",103);
 
SELECT * FROM employee;

SELECT a.name as manager_name, b.name
FROM employee as a
JOIN employee as b
ON a.id = b.manager_id;

SELECT * FROM student;

SELECT AVG(marks)
FROM student;

SELECT name,marks 
FROM student
WHERE marks > (SELECT AVG(marks) FROM student);

#where

SELECT name,rollno
FROM student
WHERE rollno IN
 (SELECT rollno 
 FROM student 
 WHERE rollno % 2 = 0)
;

SELECT * 
FROM student
WHERE city = "Delhi";

#from

SELECT MAX(marks)
FROM (SELECT * 
FROM student
WHERE city = "Delhi") as temp;

#select

SELECT (SELECT max(marks) FROM student), name
FROM student;

CREATE VIEW view1 AS 
SELECT rollno,name, marks FROM student;

SELECT * FROM view1;







