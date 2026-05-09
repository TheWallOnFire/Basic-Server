# Database Design Basics

Proper database design is crucial for building scalable, maintainable, and efficient applications. Poor design can lead to data anomalies, slow queries, and massive technical debt.

## 1. Entities and Attributes
- **Entity**: An object, person, place, or event that you want to store data about (e.g., `Student`, `Course`, `Order`). In a relational database, entities typically become Tables.
- **Attribute**: A characteristic or property of an entity (e.g., a Student's `Name`, `Date of Birth`, `Email`). These become Columns.

## 2. Primary Keys and Foreign Keys
- **Primary Key (PK)**: A unique identifier for a record in a table. It cannot be null and must be unique (e.g., `student_id`).
- **Foreign Key (FK)**: A field in one table that uniquely identifies a row of another table. It establishes a link (relationship) between the two tables.

## 3. Relationships
- **One-to-One (1:1)**: A record in Table A is related to exactly one record in Table B (e.g., `User` and `User_Profile`).
- **One-to-Many (1:N)**: A record in Table A relates to multiple records in Table B, but a record in Table B relates to only one record in Table A (e.g., `Department` and `Employees`).
- **Many-to-Many (M:N)**: Multiple records in Table A relate to multiple records in Table B (e.g., `Students` and `Courses`). This requires a **Junction Table** (like `Enrollments`) to map the relationship.

## 4. Normalization
Normalization is the process of organizing data to minimize redundancy and improve data integrity.

### First Normal Form (1NF)
- Each column must contain atomic (indivisible) values.
- Each column must have a unique name.
- Order of rows and columns doesn't matter.
*(No comma-separated lists in a single column!)*

### Second Normal Form (2NF)
- Must be in 1NF.
- All non-key attributes must be fully dependent on the primary key. (No partial dependency).

### Third Normal Form (3NF)
- Must be in 2NF.
- There must be no transitive dependency. (A non-key attribute cannot depend on another non-key attribute).
*(If you have a `City` column and a `Zip_Code` column, `City` depends on `Zip_Code`. They should be moved to a separate table).*

## 5. Denormalization
While normalization reduces duplication, it requires `JOIN` operations which can slow down reads. Denormalization is the intentional introduction of redundancy to optimize read performance. This is heavily used in NoSQL databases and Data Warehouses.
