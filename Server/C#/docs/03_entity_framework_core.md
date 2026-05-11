# 03. Entity Framework Core (EF Core)

EF Core is a lightweight, extensible, open-source, and cross-platform version of the popular Entity Framework data access technology.

## 1. What is an ORM?
An **Object-Relational Mapper** allows you to work with a database using .NET objects, eliminating the need for most of the data-access code you'd usually need to write.

## 2. Key Components
- **DbContext**: Represents a session with the database and allows you to query and save instances of your entities.
- **DbSet<T>**: Represents a collection of entities in the database.
- **Migrations**: Allows you to evolve your database schema as your model changes.

## 3. Workflows
- **Code First**: You write the C# classes first, and EF Core generates the database.
- **Database First**: You generate C# classes from an existing database schema.

## 4. Querying Data
EF Core uses LINQ to query data.
```csharp
using (var context = new MyDbContext())
{
    var user = context.Users
                      .Include(u => u.Posts) // Eager loading
                      .FirstOrDefault(u => u.Id == 1);
}
```

## 5. Tracking vs No-Tracking
- **Tracking**: EF Core keeps track of changes to entities so it can save them automatically.
- **AsNoTracking()**: Used for read-only queries to improve performance and reduce memory usage.
