
-- CREATING TABLE
CREATE TABLE students(
  student_id SERIAL PRIMARY KEY, 
  student_name VARCHAR(50),
  age INTEGER, 
  email text, 
  frontend_mark INTEGER, 
  backend_mark INTEGER,
  status VARCHAR(50)
  -- PRIMARY KEY (student_id)
);

SELECT * from students;
DROP TABLE students;
TRUNCATE TABLE students; 
INSERT INTO students(student_id,student_name,age,email,frontend_mark,backend_mark) VALUES
(1, 'Sameer',21,'sameer@example.com',48,60), 
(2, 'Zoya',23,'zoya@example.com',53,58), 
(3, 'Nabil',22,'nabil@example.com',37,46), 
(4, 'Rafi',24,'rafi@example.com',41,40), 
(5, 'Sophia',22,'sophia@example.com',50,52), 
(6, 'Hasan',23,'hasan@gmail.com',43,39);

CREATE TABLE courses(
  course_id SERIAL PRIMARY KEY,  
  course_name VARCHAR(50),
  credits INTEGER
);
SELECT * from courses; 
DROP TABLE courses; 
TRUNCATE TABLE courses;
INSERT INTO courses(course_id, course_name, credits) VALUES
(1, 'Next.js', 3), 
(2, 'React.js', 4), 
(3, 'Databases', 3), 
(4,'Prisma', 3);

CREATE TABLE enrollment(
  enrollment_id int PRIMARY KEY, 
  student_id INTEGER REFERENCES students(student_id),
  course_id INTEGER REFERENCES courses(course_id)
);
SELECT * from enrollment; 
DROP TABLE enrollment; 
TRUNCATE TABLE enrollment;
INSERT INTO enrollment(enrollment_id, student_id, course_id) VALUES
(1, 1, 1), 
(2, 1, 2), 
(3, 2, 1), 
(4, 3, 2);

-- Query 1: Insert a new student record with the following details:
INSERT INTO students(student_id, student_name,age,email,frontend_mark,backend_mark) VALUES
(7, 'Shohedul',25,'mdshohed@gmail.com',59,60);

-- Query 2: Retrieve the names of all students who are enrolled in the course titled 'Next.js'.
SELECT s.student_name
FROM students s
JOIN enrollment e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE c.course_name = 'Next.js';

-- Query 3: Update the status of the student with the highest total (frontend_mark + backend_mark) to 'Awarded'.
UPDATE students
SET status = 'Awarded'
WHERE student_id = (
  SELECT student_id
  FROM students
  ORDER BY (frontend_mark + backend_mark) DESC
  LIMIT 1
);

-- Query 4: Delete all courses that have no students enrolled.
DELETE FROM courses
WHERE course_id NOT IN (
  SELECT DISTINCT course_id
  FROM enrollment
);

-- Query 5: Retrieve the names of students using a limit of 2, starting from the 3rd student.
SELECT student_name
FROM students
ORDER BY student_id
LIMIT 2
OFFSET 2;

-- Query 6: Retrieve the course names and the number of students enrolled in each course.
SELECT c.course_name, COUNT(e.student_id) AS students_enrolled
FROM courses c
LEFT JOIN enrollment e ON c.course_id = e.course_id
GROUP BY c.course_name;

-- Query 7: Calculate and display the average age of all students.
SELECT AVG(age) AS average_age
FROM students;

-- Query 8: Retrieve the names of students whose email addresses contain 'example.com'.
SELECT student_name
FROM students
WHERE email LIKE '%example.com%';