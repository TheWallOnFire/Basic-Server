# 05. Entity Framework Core

Entity Framework (EF) Core is a lightweight, extensible, and cross-platform version of the popular Entity Framework data access technology.

---

## 1. The DbContext
The `DbContext` is the most important class. It represents a session with the database.
- It tracks changes to your objects.
- It translates LINQ queries into SQL.
- It handles the connection to the database.

---

## 2. Modeling (Fluent API)
While you can use Attributes (`[Key]`), the **Fluent API** is more powerful and keeps your domain classes "clean" of database logic.
```csharp
protected override void OnModelCreating(ModelBuilder modelBuilder)
{
    modelBuilder.Entity<Product>()
        .Property(p => p.Name)
        .IsRequired()
        .HasMaxLength(100);
}
```

---

## 3. Relationships
EF Core makes handling relationships easy:
- **One-to-Many**: A `Category` has many `Products`.
- **Many-to-Many**: An `Order` has many `Products`, and a `Product` is in many `Orders` (EF Core handles the join table automatically).

---

## 4. Migrations
Migrations allow you to update your database schema without losing data.
1. `dotnet ef migrations add InitialCreate` (Creates the code).
2. `dotnet ef database update` (Applies the changes to the real DB).

---

## 5. Performance Best Practices
- **`AsNoTracking()`**: Use this for read-only queries (it's much faster because EF doesn't need to track changes).
- **Pagination**: Never use `.ToList()` on a large table. Use `.Skip(x).Take(y)`.
- **Eager Loading**: Use `.Include()` to load related data in a single query, avoiding the "N+1" problem.

---

## 🚀 Pro Tip
Always use **Migrations**. Never manually change the database schema in production. This ensures your code and database are always in sync.
