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










