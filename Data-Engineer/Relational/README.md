# Relational Databases (SQL)

## Overview
Relational databases store data in tables with predefined schemas and use Structured Query Language (SQL) for data manipulation. They are best for applications requiring ACID compliance and complex relationships.

## Tools in this Category
- **[PostgreSQL](./PostgreSQL/)**: The world's most advanced open-source database.
- **[MySQL](./MySQL/)**: The most popular open-source database, known for speed and reliability.
- **[SQLite](./SQLite/)**: A lightweight, file-based database for local storage and mobile apps.

## Comparison
| Feature | PostgreSQL | MySQL | SQLite |
| :--- | :--- | :--- | :--- |
| **ACID** | Full | Full (with InnoDB) | Full |
| **Concurrency** | MVCC (High) | MVCC (High) | File-locking (Low) |
| **JSON Support**| Excellent (Native) | Good | Limited |
| **Scaling** | Vertical / Master-Slave | Vertical / Clustering | Local Only |
