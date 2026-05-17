# 02a. Advanced Attributes & Reflection

Attributes and Reflection are the tools that allow C# to be "self-aware." They enable meta-programming, where code can inspect and modify its own behavior or the behavior of other code at runtime.

---

## 1. Advanced Attribute Features

Attributes are declarative tags that provide extra metadata. While basic usage is common, advanced applications require deeper understanding.

### Assembly-Level Attributes
You can apply attributes to an entire assembly rather than a specific class or method. These are usually placed in `AssemblyInfo.cs` or the `.csproj` file.
```csharp
[assembly: InternalsVisibleTo("MyProject.Tests")] // Allows test project to see 'internal' members
[assembly: AssemblyVersion("1.0.0.0")]
```

### Caller Information Attributes
These are special attributes provided by the compiler to help with logging and diagnostics without using reflection. They are applied to optional parameters.
```csharp
public void LogMessage(string message,
    [CallerMemberName] string memberName = "",
    [CallerFilePath] string sourceFilePath = "",
    [CallerLineNumber] int sourceLineNumber = 0)
{
    Console.WriteLine($"{message} (Logged from {memberName} in {sourceFilePath} at line {sourceLineNumber})");
}
// Usage: LogMessage("Database connected!"); // The compiler fills in the caller details automatically.
```

---

## 2. Deep Dive: Custom Attributes

When defining custom attributes by inheriting from `System.Attribute`, you use `[AttributeUsage]` to control their behavior.

### `AttributeUsage` Parameters
- **`ValidOn`**: Restricts where the attribute can be placed (e.g., `AttributeTargets.Class | AttributeTargets.Method`).
- **`AllowMultiple`**: Determines if the attribute can be applied more than once to the same element.
- **`Inherited`**: Determines if the attribute is inherited by derived classes.

```csharp
[AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = false)]
public class FeatureToggleAttribute : Attribute
{
    public string FeatureName { get; }
    public FeatureToggleAttribute(string featureName) => FeatureName = featureName;
}
```

### Implementing Custom Validation
A common advanced use case is creating custom validation attributes by inheriting from `ValidationAttribute` (used in ASP.NET and EF Core).
```csharp
public class MustBeEvenAttribute : ValidationAttribute
{
    protected override ValidationResult IsValid(object value, ValidationContext validationContext)
    {
        if (value is int intValue && intValue % 2 != 0)
        {
            return new ValidationResult("The value must be an even number.");
        }
        return ValidationResult.Success;
    }
}
```

---

## 3. Advanced Reflection Techniques

Reflection (`System.Type`) allows you to inspect metadata at runtime, but it can also be used to interact with code dynamically.

### Dynamic Invocation and Instantiation
You can create instances of classes and invoke methods without knowing them at compile time.
```csharp
Type type = typeof(MyService);

// Instantiate dynamically
object instance = Activator.CreateInstance(type);

// Find and invoke a private method
MethodInfo method = type.GetMethod("SecretMethod", BindingFlags.NonPublic | BindingFlags.Instance);
method.Invoke(instance, null);
```
*Note: `BindingFlags` are essential for filtering exactly what members you want to find via reflection.*

### Reading Custom Attributes
Frameworks read attributes to determine behavior.
```csharp
var type = typeof(OrderService);
// Retrieve all FeatureToggle attributes applied to this class
var features = type.GetCustomAttributes<FeatureToggleAttribute>();

foreach (var feature in features)
{
    Console.WriteLine($"Feature enabled: {feature.FeatureName}");
}
```

---

## 4. The Performance Cost & Source Generators

**Reflection is computationally expensive.** It relies on late binding and string lookups, which bypass compiler optimizations.

### Source Generators (The Modern Alternative)
Introduced in C# 9, **Source Generators** allow you to write code that inspects your application's code *during compilation* and generates new C# source files.
- **Why?** It completely removes the runtime cost of Reflection.
- **How it works**: The generator runs in the background as you type. If it sees a specific `[Attribute]`, it instantly generates the boilerplate code needed, turning reflection-based logic into highly optimized compile-time code.

---

## 🚀 Pro Tip
Always prefer **Source Generators** or **Caller Information Attributes** over Reflection if performance is critical. Use Reflection primarily for debugging, diagnostic tools, or building highly generic frameworks where compile-time types are impossible to know.
