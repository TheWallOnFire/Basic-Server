# Liquibase & Flyway

## Description
Liquibase and Flyway are open-source database schema change management tools. They allow you to treat your database schema as code, versioning it just like your application code.

## Why use them?
- **Version Control**: Track every change to the database.
- **CI/CD Integration**: Automatically apply schema changes during deployment.
- **Team Collaboration**: Prevent developers from having conflicting local schemas.
- **Rollbacks**: Safely undo changes if something goes wrong.

## Comparison

| Feature | Flyway | Liquibase |
| :--- | :--- | :--- |
| **Philosophy** | "Simplicity First" | "Flexibility First" |
| **Formats** | Pure SQL | XML, YAML, JSON, SQL |
| **Logic** | Fixed migration order | Pre-conditions & Contexts |
| **Rollbacks** | Paid version only | ✅ Built-in (XML/YAML) |
| **Learning Curve** | Low | Medium |

## How to code it (Flyway SQL)
```sql
-- V1__Create_users_table.sql
CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- V2__Add_email_to_users.sql
ALTER TABLE users ADD COLUMN email VARCHAR(255);
```

## How to code it (Liquibase YAML)
```yaml
databaseChangeLog:
  - changeSet:
      id: 1
      author: alice
      changes:
        - createTable:
            tableName: users
            columns:
              - column:
                  name: id
                  type: int
                  constraints:
                    primaryKey: true
```
