# 03. Entity Framework Core (EF Core)

EF Core is a lightweight, extensible, open-source, and cross-platform version of the popular Entity Framework data access technology.

## 1. What is an ORM?
An **Object-Relational Mapper** allows you to work with a database using .NET objects, eliminating the need for most of the data-access code you'd usually need to write.

## 2. Key Components
- **DbContext**: Represents a session with the database and allows you to query and save instances of your entities.
- **DbSet<T>**: Represents a collection of entities in the database.
- **Migrations**: Allows you to evolve your database schema as your model changes.

## 4. Configuring Models (Fluent API vs Data Annotations)
- **Data Annotations**: Attributes on classes (`[Key]`, `[Required]`).
- **Fluent API**: Defined in `OnModelCreating`. More powerful for complex relationships.
  ```csharp
  modelBuilder.Entity<Post>()
              .HasOne(p => p.Author)
              .WithMany(a => a.Posts)
              .HasForeignKey(p => p.AuthorId);
  ```

## 5. Advanced Features
- **Global Query Filters**: Automatically filter data (e.g., Soft Delete: `WHERE IsDeleted = false`).
- **Interceptors**: Intercept DB operations for logging or auditing.
- **Lazy Loading**: Loading related data only when it's accessed (be careful with N+1!).

## 6. Tracking vs No-Tracking
- **Tracking**: EF Core watches entities for changes.
- **AsNoTracking()**: Fast, read-only queries.

## 7. Dapper (The Lightweight Alternative)
Dapper is a "Micro-ORM" that provides high-performance mapping for raw SQL.
- **Why use it?**: When you need absolute control over SQL performance.
- **Usage**: Extends `IDbConnection` with methods like `.Query<T>()`.
