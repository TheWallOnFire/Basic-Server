# 06. Entity Framework Core

Entity Framework (EF) Core is a lightweight, extensible, open source, and cross-platform version of the popular Entity Framework data access technology.

## 1. Core Concepts
- **DbContext**: The primary class that coordinates Entity Framework functionality for a data model.
- **DbSet**: Represents a collection of entities that can be queried from the database.
- **Migrations**: A way to incrementally update the database schema to keep it in sync with the application's data model.

## 2. Modeling
- **Code-First**: Define your model using C# classes, and EF Core creates the database.
- **Data Annotations**: Attributes like `[Key]`, `[Required]`, `[StringLength]` to configure the model.
- **Fluent API**: A more powerful way to configure the model using code in `OnModelCreating`.

## 3. Querying Data
- **LINQ**: Query entities using C# syntax.
- **Eager Loading**: `Include()` to load related data in a single query.
- **Explicit Loading**: `Load()` to load related data later.
- **Lazy Loading**: Automatically load related data when accessed (requires proxies).

## 4. Saving Data
- **Add/Update/Delete**: Methods to track changes in the DbContext.
- **SaveChanges()**: Persists all tracked changes to the database in a single transaction.

## 5. Performance Tips
- **No-Tracking Queries**: `AsNoTracking()` for read-only scenarios.
- **Batching**: EF Core automatically batches multiple statements.
- **Connection Pooling**: Reusing database connections for better performance.

## 6. DB Providers
EF Core supports many databases:
- SQL Server
- PostgreSQL (Npgsql)
- MySQL / MariaDB
- SQLite
- In-Memory (for testing)
