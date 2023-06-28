-- New Database
CREATE DATABASE icicidb;
DROP DATABASE icicidb;

USE icicidb;

CREATE TABLE employee_details(
	employee_id INT IDENTITY(101,1),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50)
);

EXEC sp_help employee_details;

SELECT * FROM employee_details;

INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra'),
('Truput','Acharekar',1000,'Female','1987-08-29','Mumbai','Maharashtra');

-- ALTER TABLE
-- add column
ALTER TABLE employee_details
ADD email VARCHAR(50);

SELECT * FROM employee_details;

--  drop column
ALTER TABLE employee_details
DROP COLUMN email;

ALTER TABLE employee_details
ALTER COLUMN email VARCHAR(30);

EXEC sp_help employee_details;

-- Rename column
EXEC sp_rename 'employee_details.email' ,
'email_address' , 'COLUMN'

SELECT * FROM employee_details;

-- DROP TABLE 
DROP TABLE employee_details;

-- Constraints
--1. Primary Key
CREATE TABLE employee_details(
	employee_id INT IDENTITY(101,1),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50),
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id)
);

INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra'),
('Trupti','Acharekar',1000,'Female','1987-08-29','Mumbai','Maharashtra');

SELECT * FROM employee_details;

DROP TABLE employee_details;

-- Composite Primary Key
CREATE TABLE employee_details(
	employee_id INT IDENTITY(101,1),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50),
	CONSTRAINT f_l_name_pk  PRIMARY KEY(first_name,last_name)
);


INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra'),
('Vivek','Gohil',1000,'Female','1987-08-29','Mumbai','Maharashtra');

INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state)
VALUES
('Vivek','Patil',1000,'Female','1987-08-29','Mumbai','Maharashtra');

SELECT * FROM employee_details;

-- Foreign Key


CREATE TABLE department_details(
	department_id INT,
	department_name NVARCHAR(50),
	CONSTRAINT department_id_pk PRIMARY KEY(department_id)
);

INSERT INTO department_details
VALUES(1,'Sales'),(2,'IT');

SELECT * FROM department_details;

DROP TABLE employee_details;

CREATE TABLE employee_details(
	employee_id INT IDENTITY(101,1),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50),
	departmnet_id INT,
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id),
	CONSTRAINT department_id_fk FOREIGN KEY(departmnet_id) 
	REFERENCES department_details(department_id)
);

INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state,departmnet_id)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra',1),
('Trupti','Acharekar',1000,'Female','1987-08-29','Mumbai','Maharashtra',1);

SELECT * FROM employee_details;

--Error
INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state,departmnet_id)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra',3);

-- CHECK 
DROP TABLE employee_details;

CREATE TABLE employee_details(
	employee_id INT IDENTITY(101,1),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50),
	departmnet_id INT,
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id),
	CONSTRAINT department_id_fk FOREIGN KEY(departmnet_id) 
	REFERENCES department_details(department_id),
	CONSTRAINT date_of_birth_ck 
		CHECK ( DATEDIFF(YEAR,date_of_birth,GETDATE()) >= 18 )
);

SELECT DATEDIFF(YEAR,'1989-01-18',GETDATE())

INSERT INTO employee_details(first_name,last_name,salary,gender,date_of_birth,city,state,departmnet_id)
VALUES
('Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra',2);


DROP TABLE employee_details;

CREATE TABLE employee_details(
	employee_id NVARCHAR(20),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50),
	[state] NVARCHAR(50),
	departmnet_id INT,
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id),
	CONSTRAINT department_id_fk FOREIGN KEY(departmnet_id) 
	REFERENCES department_details(department_id),
	CONSTRAINT date_of_birth_ck CHECK ( DATEDIFF(YEAR,date_of_birth,GETDATE()) >= 18 ),
	CONSTRAINT employee_id_ck CHECK (employee_id LIKE 'EMP%')
);

INSERT INTO employee_details
VALUES
('EMP101','Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra',2);

INSERT INTO employee_details
VALUES
('102','Vivek','Gohil',1000,'Male','1989-01-19','Mumbai','Maharashtra',2);

-- Default
DROP TABLE employee_details;

CREATE TABLE employee_details(
	employee_id NVARCHAR(20),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	date_of_birth DATE,
	city NVARCHAR(50) DEFAULT 'Mumbai',
	[state] NVARCHAR(50),
	departmnet_id INT,
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id),
	CONSTRAINT department_id_fk FOREIGN KEY(departmnet_id) 
	REFERENCES department_details(department_id),
	CONSTRAINT date_of_birth_ck CHECK ( DATEDIFF(YEAR,date_of_birth,GETDATE()) >= 18 ),
	CONSTRAINT employee_id_ck CHECK (employee_id LIKE 'EMP%')
);

INSERT INTO employee_details(employee_id,first_name,last_name,salary,gender,date_of_birth,state,departmnet_id)
VALUES
('EMP101','Vivek','Gohil',1000,'Male','1989-01-19','Maharashtra',2);


INSERT INTO employee_details
VALUES
('EMP102','Trupti','Acharekar',1000,'Female','1989-01-19',default,'Maharashtra',2);

SELECT * FROM employee_details;

-- NOT NULL AND UNIQUE
DROP TABLE employee_details;

CREATE TABLE employee_details(
	employee_id NVARCHAR(20),
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	gender NVARCHAR(6),
	email NVARCHAR(50) NOT NULL,
	date_of_birth DATE,
	city NVARCHAR(50) DEFAULT 'Mumbai',
	[state] NVARCHAR(50),
	departmnet_id INT,
	CONSTRAINT employee_id_pk  PRIMARY KEY(employee_id),
	CONSTRAINT department_id_fk FOREIGN KEY(departmnet_id) 
	REFERENCES department_details(department_id),
	CONSTRAINT date_of_birth_ck CHECK ( DATEDIFF(YEAR,date_of_birth,GETDATE()) >= 18 ),
	CONSTRAINT employee_id_ck CHECK (employee_id LIKE 'EMP%'),
	CONSTRAINT email_uq UNIQUE(email)
);

INSERT INTO employee_details
VALUES
('EMP102','Trupti','Acharekar',1000,'Female','trupti.acharekar@email.com','1989-01-19',default,'Maharashtra',2);

--ERROR - NOT NULL
INSERT INTO employee_details
VALUES
('EMP101','Trupti','Acharekar',1000,'Female',NULL,'1989-01-19',default,'Maharashtra',2);

--ERROR - UNIQUE
INSERT INTO employee_details
VALUES
('EMP101','Trupti','Acharekar',1000,'Female','trupti.acharekar@email.com','1989-01-19',default,'Maharashtra',2);


USE icicidb;

SELECT * FROM employee_details;

-- Print employee_id , first_name , last_name of all employees
SELECT employee_id , first_name , last_name
FROM employee_details;	

-- Print all Male employee details
SELECT * FROM employee_details WHERE gender = 'Male';

-- Print all Female employee details
SELECT * FROM employee_details WHERE gender = 'Female';

-- Print all employees having salary > 5000
SELECT * FROM employee_details WHERE salary > 5000;

-- Print all employees who lives in Maharashtra , Gujart , Karnataka
SELECT * FROM employee_details 
WHERE [state] = 'Maharashtra' OR [STATE] = 'Gujarat' OR [state] = 'Karnataka';

SELECT * FROM employee_details 
WHERE state IN ('Maharashtra' , 'Gujarat' , 'Karnataka')

-- Print all employees who is having birthday in december month
SELECT DATEPART(MONTH , date_of_birth) FROM employee_details;
SELECT * FROM employee_details WHERE DATEPART(MONTH , date_of_birth) = 12;

SELECT * FROM employee_details;

-- Print all employees in asc order by salary
SELECT * FROM employee_details ORDER BY salary;
SELECT * FROM employee_details ORDER BY salary DESC;

-- Print all employees in asc order by state
SELECT * FROM employee_details ORDER BY [state]
SELECT * FROM employee_details ORDER BY [state] , first_name

-- Print all cities names start with L
SELECT * FROM employee_details WHERE city LIKE 'L%';

-- Print all unique cities 
SELECT DISTINCT city FROM employee_details ORDER BY city;

-- Print all unique states
SELECT DISTINCT [state] FROM employee_details ORDER BY [state];

-- Print all female employees having salary > 5000
SELECT * FROM employee_details WHERE gender = 'Female' AND  salary > 5000

-- Print all male employees having salary > 5000
SELECT * FROM employee_details WHERE gender = 'Male' AND  salary > 5000

-- Print the avg salary of employees who lives in maharashtra
SELECT AVG(salary) 'average salary' FROM employee_details WHERE state = 'Maharashtra';
SELECT AVG(salary) AS 'average salary' FROM employee_details WHERE state = 'Maharashtra';

-- Print the max and min salary of employees who lives in karnataka 
SELECT MAX(salary) 'max salary' , MIN(salary) 'min salary' 
FROM employee_details WHERE state = 'Karnataka';

-- How many employees lives in Rajasthan and Punjab ?
SELECT  COUNT(employee_id) FROM employee_details WHERE state IN ('Rajasthan','Punjab');

-- Print count of employees lives in each state
SELECT state , COUNT(state) FROM employee_details GROUP BY state ORDER BY state;

-- Print the total salary earned by male and female employee.
SELECT gender , SUM(salary) 'Total Salary' FROM employee_details GROUP BY gender;

-- Print the total salary earned by employee who lives in different states.
SELECT state , SUM(salary) 'Total Salary' FROM employee_details GROUP BY state ORDER BY state;

-- Print the total salary earned by employee who lives in different states 
-- , print only if sum of salary is > 5000 .
SELECT state , SUM(salary) 'Total Salary' FROM employee_details 
GROUP BY state 
HAVING SUM(salary)  > 5000
ORDER BY state;

--Works but produce invalid data
SELECT state , SUM(salary) 'Total Salary' FROM employee_details 
WHERE salary > 5000
GROUP BY state 
ORDER BY state;

-- JOINS
-- Inner Join
-- Outer Join
	--1. Left
	--2. Right
	--3. Full
-- Cross Join
-- Self Join

-- Two tables 
--1. candidate
--2. employee
CREATE TABLE candidate(
	candidate_id INT IDENTITY,
	first_name NVARCHAR(40),
	last_name NVARCHAR(40),
	salary FLOAT
);
INSERT INTO candidate(first_name,last_name,salary) 
VALUES('Reema','Rai',0) , ('Seema','Sharma',0) , ('Meema','Mohite',0) , 
('Mona','Mhatre',0);    

CREATE TABLE employee(
	employee_id INT IDENTITY,
	first_name NVARCHAR(40),
	last_name NVARCHAR(40),
	salary FLOAT
);
INSERT INTO employee(first_name,last_name,salary) 
VALUES('Reema','Rai',1000) , ('Seema','Sharma',1000) , ('Meema','Mohite',1000) , 
('Riya','Sen',1000);    

-- CROSS JOIN
SELECT * FROM candidate CROSS JOIN employee

-- INNER JOIN
SELECT * FROM candidate INNER JOIN employee
ON
employee.first_name = candidate.first_name

SELECT * FROM candidate c INNER JOIN employee e
ON
e.first_name = c.first_name

-- OUTER JOIN
-- 1. LEFT OUTER JOIN
SELECT * FROM candidate c LEFT OUTER JOIN employee e
ON
e.first_name = c.first_name

-- 2. RIGHT OUTER JOIN
SELECT * FROM candidate c RIGHT OUTER JOIN employee e
ON
e.first_name = c.first_name

-- 3. FULL OUTER JOIN
SELECT * FROM candidate c FULL OUTER JOIN employee e
ON
e.first_name = c.first_name

-- SELF JOIN
CREATE TABLE employee_manager_details(
	employee_id INT,
	first_name NVARCHAR(50),
	last_name NVARCHAR(50),
	salary FLOAT,
	manager_id INT
);
INSERT INTO employee_manager_details
VALUES(1,'Tasneem','Shaikh',1000,NULL),(2,'Gobi','C',1000,1),
(3,'Kaushik','S',1000,2),(4,'Enika','KP',1000,2),(5,'Gopal','C',1000,4);

SELECT * FROM employee_manager_details;

-- CROSS JOIN
SELECT * FROM employee_manager_details e CROSS JOIN employee_manager_details m

SELECT * FROM employee_manager_details e 
INNER JOIN
employee_manager_details m
ON
e.manager_id = m.employee_id


SELECT e.first_name ,' Reports To ' , m.first_name  FROM employee_manager_details e 
LEFT JOIN
employee_manager_details m
ON
e.manager_id = m.employee_id

-- INDEX
SELECT * FROM employee_details;

SELECT * FROM employee_details WHERE salary = 6000;

SELECT * FROM employee_manager_details WHERE manager_id > 1;

DROP INDEX  employee_manager_details.ix_manager_id;

CREATE CLUSTERED INDEX ix_manager_id ON employee_manager_details(manager_id);

SELECT * FROM employee_details;
SELECT * FROM employee_details WHERE state = 'Maharashtra';
SELECT * FROM employee_details WHERE state = 'Uttar Pradesh';
SELECT * FROM employee_details WHERE state = 'Telangana';

CREATE PROCEDURE sp_get_employee_by_state(@state NVARCHAR(50))
AS
	SELECT * FROM employee_details WHERE state = @state


EXEC sp_get_employee_by_state 'Telangana'

EXEC sp_get_employee_by_state 'Rajasthan'

-- Create a procedure to insert new row into employee_details table
ALTER PROCEDURE sp_add_new_employee_details(
				@employee_id NVARCHAR(20),
				@first_name NVARCHAR(50),
				@last_name NVARCHAR(50),
				@salary FLOAT,
				@gender NVARCHAR(6),
				@email NVARCHAR(50),
				@date_of_birth DATE,
				@city NVARCHAR(50),
				@state NVARCHAR(50),
				@departmnet_id INT)
AS
BEGIN
INSERT INTO employee_details VALUES 
(@employee_id,@first_name,@last_name,@salary,@gender,@email,@date_of_birth,@city,@state,@departmnet_id)
SELECT * FROM employee_details;
END


EXEC sp_add_new_employee_details 'EMP132','Test','Test',1000,'Test','Test2@test.com','1999-09-09','Test','Test',1

SELECT * FROM employee_details

DROP PROCEDURE sp_add_new_employee_details;

--Views
CREATE VIEW vi_view_one
AS	
	SELECT employee_id,first_name,last_name,salary 
	FROM	employee_details;

SELECT * FROM vi_view_one;

CREATE VIEW vi_view_two
AS
	SELECT employee_id,first_name,last_name,city,state
	FROM employee_details;

SELECT * FROM vi_view_two;
SELECT * FROM vi_view_two order by state ;

-- inner/nested query

-- update department of employee id EMP102,EMP106,EMP119,EMP112 to 1
UPDATE employee_details 
SET departmnet_id = 1 WHERE employee_id IN ('EMP102','EMP106','EMP119','EMP112')



SELECT * FROM employee_details;

-- Print all employees who works in IT department
SELECT * FROM employee_details WHERE departmnet_id = (
SELECT department_id FROM department_details WHERE department_name='IT')

-- Print all employees who dont works in IT department
SELECT * FROM employee_details WHERE departmnet_id != (
SELECT department_id FROM department_details WHERE department_name='IT')









































drop table candidate;
drop table employee;












































	