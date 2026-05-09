# Database Design Patterns

Just like software engineering has design patterns (like Singleton or Factory), database architecture also relies on proven patterns to solve common scaling, performance, and flexibility problems.

Here are some of the most important Database Design Patterns to know:

## 1. Sharding / Partitioning Pattern
**The Problem**: A single database table or server becomes too large to handle the sheer volume of read/write operations or storage requirements.
**The Solution**: Split the data across multiple independent databases or tables. 
- **Horizontal Partitioning (Sharding)**: Splitting a table's rows across multiple servers based on a shard key (e.g., users A-M go to Server 1, N-Z go to Server 2).
- **Vertical Partitioning**: Splitting a table's columns into separate tables (e.g., storing a user's `bio` and `avatar_image` in a separate database from their `email` and `password` since they are queried less often).

## 2. CQRS (Command Query Responsibility Segregation)
**The Problem**: Reading data and writing data often have vastly different performance and scaling requirements. Traditional CRUD models use the same data model for both, causing bottlenecks.
**The Solution**: Separate the read models (Queries) from the write models (Commands). You might use a highly normalized SQL database for writes (to ensure data integrity) and asynchronously sync that data to an Elasticsearch or Redis instance optimized purely for fast, denormalized reads.

## 3. Event Sourcing
**The Problem**: Storing only the current state of an entity means you lose the history of how the entity reached that state (e.g., a bank account balance).
**The Solution**: Instead of storing the current state, store a sequence of immutable "events" that happened. To get the current state, you replay the events. 
- *Example*: Instead of storing `Balance: $50`, store `[Deposited $100, Withdrew $50]`. 
- Commonly used alongside **CQRS** and message brokers like **Kafka**.

## 4. Materialized View Pattern
**The Problem**: Complex queries with massive aggregations and multiple JOINs take too long to run in real-time, slowing down user dashboards.
**The Solution**: Pre-compute the results of the complex query and store them in a physical table (the "Materialized View"). This view is updated periodically (e.g., every hour) or via triggers, allowing users to query the pre-computed table instantly.

## 5. Entity-Attribute-Value (EAV) Pattern
**The Problem**: You need to store entities with a potentially infinite or highly variable number of attributes, and you cannot alter the table schema every time a new attribute is needed (e.g., an e-commerce product catalog where a TV has "Screen Size" but a Shirt has "Fabric").
**The Solution**: Store the data in three columns: Entity (the item ID), Attribute (the property name), and Value (the property's value).
- *Warning*: While extremely flexible, EAV is notorious for causing massive performance issues and complex SQL queries. It is often better solved today by using a NoSQL Document store (like MongoDB) or a JSONB column in PostgreSQL.

## 6. Polymorphic Association Pattern
**The Problem**: You have multiple tables (e.g., `Articles`, `Photos`, `Videos`) and you want users to be able to leave `Comments` on any of them. Creating a separate comment table for each (`Article_Comments`, `Photo_Comments`) is tedious.
**The Solution**: In the `Comments` table, store two columns to link the relationship: `commentable_id` (the ID of the target) and `commentable_type` (the name of the target table, e.g., 'Article' or 'Photo').
- *Warning*: This breaks traditional Foreign Key constraints, meaning the database cannot enforce referential integrity.

## 7. Soft Delete Pattern
**The Problem**: Deleting records permanently from a database can lead to accidental data loss and breaks historical reporting.
**The Solution**: Add a `deleted_at` timestamp or an `is_deleted` boolean column to the table. When a user deletes a record, just update this column. Modify all `SELECT` queries to append `WHERE deleted_at IS NULL`.
