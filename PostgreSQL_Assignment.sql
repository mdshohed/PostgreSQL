
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