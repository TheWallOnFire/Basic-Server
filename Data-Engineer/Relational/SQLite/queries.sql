-- SQLite CRUD Operations Example

-- 1. Create a Table
CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 2. Insert Records
INSERT INTO users (name, email) VALUES ('Alice', 'alice@example.com');
INSERT INTO users (name, email) VALUES ('Bob', 'bob@example.com');

-- 3. Read / Find Records
SELECT * FROM users;
SELECT name FROM users WHERE email = 'alice@example.com';

-- 4. Update Records
UPDATE users SET name = 'Alice Smith' WHERE email = 'alice@example.com';

-- 5. Delete Records
DELETE FROM users WHERE email = 'bob@example.com';
