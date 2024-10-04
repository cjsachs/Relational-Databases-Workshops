-- DDL: Data Definition Language: Creating our database based off of our ERD
CREATE DATABASE students_db;

USE students_db;

-- Create Students Table/Entity
CREATE TABLE students (
	id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone_num VARCHAR(20),
    start_date DATE
);

-- Create Cohort Table/Entity
CREATE TABLE cohort(
	id INT AUTO_INCREMENT PRIMARY KEY,
    cohort_name VARCHAR(50) NOT NULL
);

-- DML: Data Manipulation Language: Manipulating/inserting data into our tables
-- UPDATE & DELETE DATA
INSERT INTO students (
	first_name,
    last_name,
    email,
    phone_num,
    start_date
) VALUES (
	'Rene',
    'Lopez',
    'renel@ct.com',
    1-111-111-1111,
    '2024-10-01'
);

INSERT INTO students (
	first_name,
    last_name,
    email,
    phone_num,
    start_date
) VALUES (
	'Calvin',
    'Baffoe',
    'calvinb@ct.com',
    '1-222-222-2222',
    '2024-05-01'
), (
	'Amilcar',
    'Cornier',
    'amilcarc@ct.com',
    '1-333-333-3333',
    '2024-08-01'
);


INSERT INTO cohort (
	cohort_name,
    cohort_size
) VALUES (
	'Padawans',
    10
);

UPDATE students
SET email = 'beststudentever@ct.com'
WHERE id = 1;

DELETE FROM students
WHERE id = 1;

-- DQL(Data Query Language): Searching/Querying data from our database
SELECT *
FROM students;

SELECT first_name, last_name
FROM students;

-- Filtering Data (WHERE Clause)
SELECT *
FROM students
WHERE id = 1;

SELECT *
FROM students
WHERE start_date BETWEEN '2024-07-01' AND '2024-11-01'
ORDER BY first_name DESC;

-- Sorting Data (ORDER BY Clause: Ascending order is default)
SELECT *
FROM students
ORDER BY id DESC;

SELECT *
FROM cohort;

-- ALTER TABLE: Adding "cohort_id" attribute with FK constraint
ALTER TABLE students
ADD cohort_id INT;

ALTER TABLE students
ADD CONSTRAINT cohort_id
FOREIGN KEY (cohort_id) REFERENCES cohort(id);

ALTER TABLE cohort
ADD cohort_size INT;

UPDATE cohort
SET cohort_size = 20
WHERE id = 1;

-- Aggregate Functions: SUM(), MIN(), MAX(), AVG(), COUNT()

-- COUNT(): Returns the amount of entries
SELECT COUNT(*)
FROM students;

-- SUM(): Returns the sum of the entries
SELECT SUM(cohort_size)
FROM cohort;

-- MIN(): Returns the minimum value of the selected column
SELECT MIN(cohort_size)
FROM cohort;

-- MAX(): Returns the maximum value of the selected column
SELECT MAX(cohort_size)
FROM cohort;

-- AVG(): Returns the average value of the selected column
SELECT AVG(cohort_size)
FROM cohort;