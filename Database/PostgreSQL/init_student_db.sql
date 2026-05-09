-- Create the student database schema
-- You can run this file using: psql -U postgres -f init_student_db.sql

-- Drop tables if they exist to allow clean re-runs
DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

-- 1. Create Students Table
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_of_birth DATE,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Create Courses Table
CREATE TABLE courses (
    course_id SERIAL PRIMARY KEY,
    course_code VARCHAR(10) UNIQUE NOT NULL,
    course_name VARCHAR(100) NOT NULL,
    credits INT NOT NULL CHECK (credits > 0)
);

-- 3. Create Enrollments Table (Many-to-Many Relationship)
CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT REFERENCES students(student_id) ON DELETE CASCADE,
    course_id INT REFERENCES courses(course_id) ON DELETE CASCADE,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade VARCHAR(2),
    UNIQUE(student_id, course_id) -- A student can only enroll in a course once
);

-- Insert Dummy Data for Students
INSERT INTO students (first_name, last_name, email, date_of_birth) VALUES
('John', 'Doe', 'john.doe@example.com', '2001-05-15'),
('Jane', 'Smith', 'jane.smith@example.com', '2002-08-22'),
('Michael', 'Johnson', 'michael.j@example.com', '2000-11-10');

-- Insert Dummy Data for Courses
INSERT INTO courses (course_code, course_name, credits) VALUES
('CS101', 'Introduction to Computer Science', 4),
('MATH201', 'Calculus I', 4),
('ENG101', 'English Literature', 3);

-- Insert Dummy Data for Enrollments
INSERT INTO enrollments (student_id, course_id, grade) VALUES
(1, 1, 'A'), -- John Doe in CS101
(1, 2, 'B'), -- John Doe in MATH201
(2, 1, 'A'), -- Jane Smith in CS101
(3, 3, 'B+'); -- Michael Johnson in ENG101
