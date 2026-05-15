# 02. Attributes & Reflection

Attributes and Reflection are the tools that allow C# to be "self-aware." They enable meta-programming, where code can inspect and modify its own behavior or the behavior of other code at runtime.

---

## 1. Attributes: Adding Metadata
Attributes are declarative tags that provide extra information (metadata) about code elements like classes, methods, properties, or parameters. They are placed in square brackets `[]`.

### Applying Attributes
Attributes are interpreted by the compiler or at runtime by tools and frameworks.

```csharp
[Serializable] // Metadata for the .NET runtime
public class UserProfile
{
    [Obsolete("Use NewId instead")] // Compiler warning for developers
    public int OldId { get; set; }

    [Required] // Metadata for validation frameworks (EF Core, ASP.NET)
    public string Username { get; set; }
}
```

### Common Built-in Attributes
- **`[Obsolete]`**: Marks code as deprecated.
- **`[Serializable]`**: Indicates a class can be serialized.
- **`[Conditional]`**: Executes a method only if a specific preprocessor symbol is defined (e.g., `DEBUG`).
- **`[ApiController]`**: (ASP.NET) Enables API-specific behaviors.

---

## 2. Custom Attributes
You can create your own attributes by inheriting from the `System.Attribute` class.

### Defining an Attribute
Use `[AttributeUsage]` to restrict where your attribute can be applied.

```csharp
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false)]
public class DeveloperNoteAttribute : Attribute
{
    public string Note { get; }
    public string Author { get; set; } // Optional named parameter

    public DeveloperNoteAttribute(string note) // Positional parameter
    {
        Note = note;
    }
}
```

### Using the Custom Attribute
```csharp
[DeveloperNote("Optimization needed here", Author = "Alice")]
public class OrderService { }
```

---

## 3. Reflection: Inspecting Code
Reflection is the process of inspecting the metadata of assemblies, modules, and types at runtime.

### The `Type` Class
The core of reflection is the `System.Type` class. You can get a type using `typeof()` or `GetType()`.

```csharp
Type t = typeof(OrderService);
Console.WriteLine($"Name: {t.Name}");
Console.WriteLine($"Namespace: {t.Namespace}");

// List all methods
foreach (var method in t.GetMethods())
{
    Console.WriteLine($"Method: {method.Name}");
}
```

### Reading Attributes at Runtime
This is how frameworks like ASP.NET "know" what to do with your code.

```csharp
var type = typeof(OrderService);
var attr = (DeveloperNoteAttribute)Attribute.GetCustomAttribute(type, typeof(DeveloperNoteAttribute));

if (attr != null)
{
    Console.WriteLine($"Note: {attr.Note} by {attr.Author}");
}
```

---

## 4. Real-World Applications
1.  **Validation**: ASP.NET Core uses attributes like `[Required]` to automatically validate incoming requests.
2.  **Dependency Injection**: Frameworks use reflection to find constructors and inject services.
3.  **JSON Serialization**: Libraries like `System.Text.Json` use attributes like `[JsonPropertyName("id")]` to map C# properties to JSON keys.
4.  **Unit Testing**: Test runners (xUnit/NUnit) use reflection to find and execute methods marked with `[Fact]` or `[Test]`.

---

## 🚀 Pro Tip
While powerful, **Reflection is computationally expensive**. Use it sparingly in high-performance loops. If you need to perform the same reflection task repeatedly, consider caching the results.
