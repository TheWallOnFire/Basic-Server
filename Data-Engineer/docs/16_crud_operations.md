# 16. CRUD Operations Explained

**CRUD** is an acronym that refers to the four basic operations that a software application must be able to perform to manage data in a persistent storage system (like a database).

---

## 🏗️ The 4 Operations

### 1. Create (C)
Adds new records to the database.
- **SQL Command**: `INSERT INTO`
- **REST Method**: `POST`
- **Example**: Registering a new user or creating a new blog post.
```sql
INSERT INTO users (name, email) VALUES ('John Doe', 'john@example.com');
```

### 2. Read (R)
Retrieves existing data from the database.
- **SQL Command**: `SELECT`
- **REST Method**: `GET`
- **Example**: Searching for a product or viewing a user profile.
```sql
SELECT * FROM users WHERE id = 1;
```

### 3. Update (U)
Modifies existing records in the database.
- **SQL Command**: `UPDATE`
- **REST Method**: `PUT` (Replace) or `PATCH` (Modify)
- **Example**: Changing a user's password or updating an order status.
```sql
UPDATE users SET name = 'Johnny' WHERE id = 1;
```

### 4. Delete (D)
Removes data from the database.
- **SQL Command**: `DELETE`
- **REST Method**: `DELETE`
- **Example**: Canceling a subscription or removing a comment.
```sql
DELETE FROM users WHERE id = 1;
```

---

## 💡 Key Concepts & Best Practices

### Soft Delete vs. Hard Delete
- **Hard Delete**: Physically removes the row from the disk. The data is gone forever.
- **Soft Delete**: Instead of deleting, you set a flag (e.g., `is_deleted = true` or `deleted_at = timestamp`).
  - **Pros**: Data recovery, audit trails, and maintaining referential integrity.
  - **Cons**: Requires additional logic in every `SELECT` query (`WHERE is_deleted = false`).

### Bulk Operations
Performing CRUD on one row at a time is slow.
- **Bulk Insert**: Inserting 1000 rows in one command is much faster than 1000 separate commands.
- **Bulk Update**: Updating multiple rows matching a criteria.

### Transactions
For critical operations (like bank transfers), you should wrap your CRUD in a **Transaction** to ensure **[ACID](./15_database_rules_acid_base.md)** properties.
```sql
BEGIN;
UPDATE accounts SET balance = balance - 100 WHERE id = 1;
UPDATE accounts SET balance = balance + 100 WHERE id = 2;
COMMIT;
```

---

## 🔄 Mapping CRUD to REST APIs
Most modern web applications expose their data via a REST API. The mapping is almost always 1:1:

| Operation | Database (SQL) | REST API (HTTP) |
| :--- | :--- | :--- |
| **Create** | `INSERT` | `POST` |
| **Read** | `SELECT` | `GET` |
| **Update** | `UPDATE` | `PUT` / `PATCH` |
| **Delete** | `DELETE` | `DELETE` |
