# Database Indexing Strategies

## 1. What is an Index?
An index is a data structure (usually a B-Tree or Hash Map) that improves the speed of data retrieval operations on a database table at the cost of slower writes and additional storage space.

## 2. Types of Indexes
- **Clustered Index**: Determines the physical order of data in a table. Only one per table (usually the Primary Key).
- **Non-Clustered Index**: A separate structure from the data rows. Multiple per table.
- **Unique Index**: Ensures no two rows have the same value in the indexed column.
- **Composite Index**: An index on multiple columns (order matters!).
- **Full-Text Index**: Specialized for searching large text fields.

## 3. Best Practices
- **Index the "WHERE" and "JOIN" columns**: These are the most common search targets.
- **Don't over-index**: Every index makes your `INSERT` and `UPDATE` statements slower.
- **Selectivity**: Only index columns with high selectivity (e.g., `user_id` is good, `gender` is bad).
- **Covering Index**: An index that contains all the data required for a query (prevents the DB from looking at the main table).
