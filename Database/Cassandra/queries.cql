-- Cassandra Query Language (CQL) Example

-- 1. Create a Keyspace (Database equivalent)
CREATE KEYSPACE IF NOT EXISTS university 
WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1};

USE university;

-- 2. Create a Table
CREATE TABLE IF NOT EXISTS students (
    student_id UUID PRIMARY KEY,
    first_name text,
    last_name text,
    age int,
    major text
);

-- 3. Insert Data
INSERT INTO students (student_id, first_name, last_name, age, major) 
VALUES (uuid(), 'Alice', 'Smith', 22, 'Computer Science');

INSERT INTO students (student_id, first_name, last_name, age, major) 
VALUES (uuid(), 'Bob', 'Johnson', 24, 'Mathematics');

-- 4. Query Data
-- Fetch all students
SELECT * FROM students;

-- Fetch specific columns
SELECT first_name, last_name, major FROM students;

-- Note on Cassandra Querying:
-- You cannot filter (WHERE) on columns that are NOT part of the primary key.
-- To query by 'major', you must create a Secondary Index.
CREATE INDEX IF NOT EXISTS major_idx ON students (major);

-- Now this query works
SELECT * FROM students WHERE major = 'Computer Science';

-- 5. Update Data
-- Note: Updating requires specifying the PRIMARY KEY
-- UPDATE students SET age = 23 WHERE student_id = <specific-uuid>;

-- 6. Delete Data
-- DELETE FROM students WHERE student_id = <specific-uuid>;
