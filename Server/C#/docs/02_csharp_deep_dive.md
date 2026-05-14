# 02. C# Deep Dive

This guide dives into the advanced features that make C# one of the most powerful and flexible languages in the world.

---

## 1. Attributes & Reflection
These features allow you to work with **Metadata**—data about your code.

### Attributes
Attributes are like "labels" you put on classes, methods, or properties. They don't execute logic themselves but provide information to other tools.
- **Example**: `[ApiController]` tells ASP.NET Core to handle a class as a Web API.
- **Example**: `[Key]` tells EF Core that a property is a Primary Key.

### Reflection
Reflection is the ability to inspect code at runtime. You can find out what methods a class has, what attributes are on it, and even execute methods dynamically.
```csharp
var type = typeof(MyClass);
var attributes = type.GetCustomAttributes(true); // Finds all sticky notes (attributes)
```

---

## 2. Delegates & Lambdas
A **Delegate** is a type-safe function pointer. It defines "what a function should look like" (its signature).

### Action and Func
- **`Action<T>`**: A delegate for a method that returns `void`.
- **`Func<T, TResult>`**: A delegate for a method that returns a value.

### Lambda Expressions (`=>`)
Lambdas are a concise way to write anonymous methods.
```csharp
// Passing a function as a parameter
var bigNumbers = list.Where(n => n > 100); 
```
**Why?** This is the foundation of **LINQ**. It allows you to write SQL-like queries directly in C#.

---

## 3. Generics & Constraints
Generics allow you to write a class or method that can work with any data type, without losing type safety or performance (avoiding "Boxing").

```csharp
public class Box<T> // 'T' is a placeholder
{
    public T Content { get; set; }
}
```

### Constraints (`where`)
You can restrict what `T` can be.
- `where T : class` (Must be a reference type)
- `where T : new()` (Must have a parameterless constructor)
- `where T : IMyInterface` (Must implement a specific contract)

---

## 4. Async / Await (Asynchronous Programming)
This is the most important feature for modern web development. It allows your server to handle thousands of requests without blocking threads.

- **`Task`**: Represents an operation that will complete in the future.
- **`await`**: Tells the program to "pause" and wait for the task to finish *without* blocking the current thread.

```csharp
public async Task<string> GetDataAsync()
{
    var data = await _httpClient.GetStringAsync("https://api.com"); // Non-blocking!
    return data;
}
```

---

## 5. Extension Methods
Allows you to "add" methods to existing types (even types you didn't write, like `string` or `int`).

```csharp
public static class MyExtensions
{
    public static bool IsEven(this int number) => number % 2 == 0;
}

// Usage
int myNum = 10;
bool check = myNum.IsEven(); // Looks like a built-in method!
```

---

## 6. Pattern Matching
Modern C# (8.0+) introduced powerful ways to test data and extract values.
```csharp
object data = 123;
if (data is int number && number > 100) // Pattern Matching
{
    Console.WriteLine("Big integer!");
}

// Switch Expression
string result = age switch
{
    < 18 => "Minor",
    >= 18 => "Adult",
    _ => "Unknown"
};
```

---

## 🚀 Pro Tip
Master **Async/Await** and **Generics** first. They are the backbone of every modern .NET library. Understanding **Attributes and Reflection** will help you understand the "magic" behind frameworks like ASP.NET Core.
