-- PostgreSQL Queries Example (Based on init_student_db.sql schema)

-- 1. Basic Select
SELECT * FROM students;
SELECT * FROM courses;

-- 2. Joins (Fetching related data)
-- Get a list of all students and the courses they are enrolled in, including their grades
SELECT s.first_name, s.last_name, c.course_code, c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id;

-- 3. Filtering and Conditions
-- Find specific student's enrollments
SELECT c.course_name, e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE s.email = 'john.doe@example.com';

-- 4. Aggregation and Group By
-- Count the number of students enrolled in each course
SELECT c.course_name, COUNT(e.student_id) as total_enrolled
FROM courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name
ORDER BY total_enrolled DESC;

-- 5. Updating Records
-- Update a student's grade for a specific course
UPDATE enrollments 
SET grade = 'A+' 
WHERE student_id = 1 AND course_id = 2;

-- 6. Deleting Records
-- If a student drops out (Cascade delete will automatically remove their enrollments)
DELETE FROM students WHERE email = 'michael.j@example.com';
