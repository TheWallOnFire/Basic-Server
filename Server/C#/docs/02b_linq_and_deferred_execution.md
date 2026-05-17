# 02b. LINQ and Deferred Execution

**LINQ (Language Integrated Query)** is one of the most powerful features in C#. It allows you to query and manipulate collections of data using a SQL-like syntax directly in your C# code.

---

## 1. What is LINQ?

LINQ provides a uniform way to query various data sources, such as:
- In-memory objects (`IEnumerable<T>`)
- Databases (Entity Framework Core uses `IQueryable<T>`)
- XML documents
- JSON data

### Syntax Styles
There are two ways to write LINQ queries:

#### Method Syntax (Most Common)
Uses chained extension methods and lambda expressions.
```csharp
var adults = users.Where(u => u.Age >= 18).OrderBy(u => u.Name).ToList();
```

#### Query Syntax
Looks like SQL. The compiler translates it into Method Syntax under the hood.
```csharp
var adults = from u in users
             where u.Age >= 18
             orderby u.Name
             select u;
```

---

## 2. Deferred Execution (Lazy Evaluation)

This is a critical concept to understand when using LINQ. **A LINQ query is not executed when it is created; it is executed when it is iterated over.**

```csharp
var numbers = new List<int> { 1, 2, 3 };

// 1. Define the query (Execution is DEFERRED)
var evenNumbers = numbers.Where(n => n % 2 == 0); 

// 2. Modify the source collection
numbers.Add(4);

// 3. Execute the query (Evaluation happens HERE)
foreach (var num in evenNumbers) 
{
    Console.WriteLine(num); // Output: 2, 4 (because 4 was added before execution)
}
```

### Why Deferred Execution Matters?
- **Performance**: You can chain multiple operations (`Where`, `OrderBy`, `Select`) without creating intermediate lists in memory. The entire query runs in a single pass.
- **Database Efficiency**: In EF Core, building a LINQ query doesn't hit the database immediately. The framework translates the entire chained query into a single, optimized SQL statement when executed.

---

## 3. Immediate Execution

Sometimes you want to execute a query immediately and store the results in memory. You do this by calling methods that force evaluation:
- `.ToList()`
- `.ToArray()`
- `.ToDictionary()`
- Aggregation methods: `.Count()`, `.First()`, `.Any()`, `.Sum()`, `.Max()`

```csharp
var numbers = new List<int> { 1, 2, 3 };

// Query executes IMMEDIATELY
var evenList = numbers.Where(n => n % 2 == 0).ToList();

numbers.Add(4);

// evenList only contains [2]. The addition of 4 is ignored because the query already ran.
```

---

## 4. IEnumerable vs. IQueryable

Understanding the difference between these two interfaces is vital, especially when working with databases (EF Core).

### `IEnumerable<T>`
- Used for **in-memory** collections (List, Array).
- Executes queries **in memory**.
- If you use `IEnumerable` with a database, it will pull *all* records into memory first, and *then* filter them. This can cause massive performance issues.

### `IQueryable<T>`
- Inherits from `IEnumerable<T>`.
- Used for **out-of-memory** data sources (like SQL databases).
- Executes queries **on the database server**.
- The LINQ expression tree is translated into a native query language (like SQL) so the filtering happens on the server, bringing back only the necessary rows.

```csharp
// GOOD: Translated to SQL "SELECT * FROM Users WHERE Age > 18"
IQueryable<User> dbQuery = dbContext.Users.Where(u => u.Age > 18);

// BAD: Pulls ALL users into memory, THEN filters them in C#
IEnumerable<User> memQuery = dbContext.Users.ToList().Where(u => u.Age > 18); 
```

---

## 🚀 Pro Tip
Always be mindful of when your LINQ queries are executing. Avoid using `.ToList()` too early when building database queries, as you lose the benefits of deferred execution and `IQueryable` optimization.
