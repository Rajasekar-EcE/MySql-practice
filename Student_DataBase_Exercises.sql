-- Create a new schema/database
CREATE SCHEMA ex25;

-- Switch to the created schema
USE ex25;

-- Question 1: Create a table named "Students" with columns for ID (INT), Name (VARCHAR) and Age (INT).
CREATE TABLE Students (
    id INT,
    name VARCHAR(50),
    age INT
);

-- Question 2: Add a new column "Grade" (VARCHAR) to the "Students" table.
ALTER TABLE Students ADD COLUMN grade VARCHAR(50);

-- Question 3: Rename the "Grade" column to "FinalGrade."
ALTER TABLE Students CHANGE COLUMN grade finalGrade VARCHAR(50);
-- (OR)
-- ALTER TABLE Students RENAME COLUMN grade TO finalGrade;

-- Question 4: Insert 10 new students as dummy Records.
INSERT INTO Students(id, name, age, finalGrade) 
VALUES
    (101, 'John Doe', 20, 'A'),
    (102, 'Jane Smith', 22, 'B'),
    (103, 'Bob Johnson', 19, 'C'),
    (104, 'Alice Brown', 21, 'A'),
    (105, 'Charlie Davis', 20, 'B'),
    (106, 'Emma Wilson', 23, 'A'),
    (107, 'Michael Lee', 20, 'C'),
    (108, 'Olivia Moore', 19, 'B'),
    (109, 'William Turner', 21, 'A'),
    (110, 'Sophia Rodrigue', 22, 'C');

-- Question 5: Update the age of student with ID 101 to 21.
UPDATE Students SET age = 21 WHERE id = 101;

-- Question 6: Delete the student with ID 101 from the "Students" table.
DELETE FROM Students WHERE id = 101;

-- Question 7: Retrieve all students aged 19 or older.
SELECT * FROM Students WHERE age >= 19;

-- Question 8: Retrieve students named 'William Turner' or 'Alice Brown'.
SELECT * FROM Students WHERE name IN ('Alice Brown', 'William Turner');

-- Question 9: Retrieve students with grades 'A' or 'B' and aged 20 or older.
SELECT * FROM Students WHERE finalGrade IN ('A', 'B') AND age >= 20;

-- Question 10: Retrieve students aged between 19 and 20.
SELECT * FROM Students WHERE age BETWEEN 19 AND 20;

-- Question 11: Retrieve students with ages less than 18.
SELECT * FROM Students WHERE age < 18;

-- Question 12: Retrieve students with grades greater than 'C'.
SELECT * FROM Students WHERE finalGrade > 'C';

-- Question 13: Count the total number of students.
SELECT COUNT(name) AS total FROM Students;

-- Question 14: Calculate the average age of students.
SELECT AVG(age) AS Average FROM Students;

-- Question 15: Find the average age of students with grades 'A' or 'B'.
SELECT AVG(age) FROM Students WHERE finalGrade IN ('A', 'B');

-- Question 16: Group students by grade and count the number of students in each grade.
SELECT finalGrade, COUNT(name) AS counts FROM Students GROUP BY finalGrade ORDER BY finalGrade ASC;

-- Question 17: Group students by age and calculate the average age in each group.
SELECT age, AVG(age) FROM Students GROUP BY age ORDER BY age DESC;

-- Question 18: Insert a new student with ID 101, name 'Rajasekar', age 21, and grade 'C'.
INSERT INTO Students VALUES (101, 'Rajasekar', 21, 'C');

-- Question 19: Retrieve the grade with the highest number of students.
SELECT finalGrade, COUNT(*) FROM Students GROUP BY finalGrade ORDER BY COUNT(*) DESC LIMIT 1;

-- Question 20: Retrieve grades where the average age is greater than 20.
SELECT finalGrade, AVG(age) FROM Students GROUP BY finalGrade HAVING AVG(age) > 20;

-- Question 21: Retrieve grades that have fewer than 3 students.
SELECT finalGrade, COUNT(*) FROM Students GROUP BY finalGrade HAVING COUNT(*) < 3;

-- Question 22: Retrieve grades with average age between 20 and 25.
SELECT finalGrade, AVG(age) FROM Students GROUP BY finalGrade HAVING AVG(age) BETWEEN 20 AND 25;

-- Question 23: Retrieve all students ordered by age in ascending order.
SELECT * FROM Students ORDER BY age ASC;

-- Question 24: Retrieve students with grades 'A' or 'B' ordered by age descending.
SELECT * FROM Students WHERE finalGrade IN ('A', 'B') ORDER BY age DESC;

-- Question 25: Retrieve student names and their final grades ordered by grade ascending.
SELECT name, finalGrade FROM Students ORDER BY finalGrade ASC;

-- Question 26: Delete all data from the "Students" table.
TRUNCATE TABLE Students;

-- Question 27: Retrieve all records from the "Students" table (should be empty after truncate).
SELECT * FROM Students;

-- Question 28: Drop the "Students" table.
DROP TABLE Students;
