-- MySQL CRUD Operations Example

-- 1. Create a table
CREATE TABLE IF NOT EXISTS employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert records
INSERT INTO employees (name, department, salary) VALUES 
('Alice Smith', 'Engineering', 85000.00),
('Bob Johnson', 'Marketing', 60000.00),
('Charlie Brown', 'Engineering', 75000.00);

-- 3. Select records
-- Get all employees
SELECT * FROM employees;

-- Get employees in Engineering earning more than 70k
SELECT name, salary 
FROM employees 
WHERE department = 'Engineering' AND salary > 70000;

-- 4. Update records
UPDATE employees 
SET salary = 90000.00 
WHERE name = 'Alice Smith';

-- 5. Delete records
DELETE FROM employees 
WHERE name = 'Bob Johnson';

-- 6. Aggregation
-- Get average salary by department
SELECT department, AVG(salary) as average_salary, COUNT(*) as employee_count
FROM employees
GROUP BY department;
