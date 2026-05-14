# 18. Database Programmability: Triggers, Procedures, and Views

Beyond simple CRUD, most relational databases (SQL) offer powerful server-side features that allow you to embed logic directly into the database engine.

---

## 1. Triggers
A Trigger is a special type of stored procedure that automatically runs ("fires") when an event occurs in the database server.
- **Events**: `INSERT`, `UPDATE`, or `DELETE`.
- **Timing**: `BEFORE` or `AFTER` the event.
- **Use Case**: Auditing changes (e.g., "Every time a price is updated, log the old price to `price_history`").

```sql
CREATE TRIGGER log_price_change
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
    INSERT INTO audit_log (product_id, old_price, new_price)
    VALUES (OLD.id, OLD.price, NEW.price);
END;
```

---

## 2. Stored Procedures
A Stored Procedure is a group of SQL statements that has been created and stored in the database.
- **Pros**: Better performance (pre-compiled), improved security (prevents SQL injection), and reduced network traffic.
- **Use Case**: Complex multi-step operations like "Onboarding a new user" (creating user, assigning roles, creating default settings).

```sql
CREATE PROCEDURE OnboardUser(IN name VARCHAR(100), IN email VARCHAR(100))
BEGIN
    INSERT INTO users (name, email) VALUES (name, email);
    INSERT INTO user_settings (user_id, theme) VALUES (LAST_INSERT_ID(), 'dark');
END;
```

---

## 3. Views
A View is a "virtual table" based on the result-set of an SQL statement.
- **Pros**: Simplifies complex queries, provides a security layer (hiding sensitive columns), and ensures consistency across multiple reports.
- **Use Case**: Creating a `v_active_orders` view that filters out canceled or pending orders, so developers don't have to remember the `WHERE` clause every time.

```sql
CREATE VIEW v_active_orders AS
SELECT id, customer_id, total 
FROM orders 
WHERE status = 'SHIPPED';
```

---

## 4. Functions (UDF)
User-Defined Functions (UDFs) are routines that accept parameters, perform an action, such as a complex calculation, and return the result of that action as a value.
- **Difference from Procedures**: Functions **must** return a value and can be used directly inside a `SELECT` statement.
- **Use Case**: Calculating VAT or converting currency.

```sql
SELECT name, price, CalculateVAT(price) as price_with_tax FROM products;
```

---

## 5. Constraints
Constraints are the "rules" that the database enforces to maintain data integrity.
- **NOT NULL**: Column cannot have a NULL value.
- **UNIQUE**: All values in a column must be different.
- **PRIMARY KEY**: Uniquely identifies each row.
- **FOREIGN KEY**: Prevents actions that would destroy links between tables.
- **CHECK**: Ensures that the value in a column meets a specific condition (e.g., `age >= 18`).

---

## ⚠️ The "Business Logic" Debate
Should you put logic in the database (Triggers/Procedures) or in the application code?
- **Database Logic**: Faster, centralizes rules for all apps using the DB. Harder to version control and scale.
- **Application Logic**: Easier to test, scale horizontally, and version control. Can lead to "N+1" problems and multiple apps might implement rules differently.
