# 01b. Error Handling & Parsing

Robust error handling is the backbone of professional C# applications. It ensures your application doesn't crash unexpectedly and provides meaningful feedback when things go wrong.

---

## 1. Exceptions in C#

An **Exception** is an object that describes an error or unexpected behavior that occurs during the execution of a program.

### The `Exception` Base Class
All exceptions in .NET derive from the `System.Exception` class. Common properties include:
- `Message`: A human-readable description of the error.
- `StackTrace`: A string representing the call stack at the moment the exception was thrown.
- `InnerException`: If this exception was caused by another exception, it’s stored here.

### Common Built-in Exceptions
- `ArgumentNullException`: Thrown when a method is passed a `null` argument that it doesn't allow.
- `InvalidOperationException`: Thrown when an object's state doesn't support the requested operation.
- `IndexOutOfRangeException`: Thrown when trying to access an array or collection index that doesn't exist.
- `FileNotFoundException`: Thrown when an attempt to access a file fails because it's missing.

---

## 2. The Try-Catch-Finally Block

To handle exceptions, we use the `try`, `catch`, and `finally` blocks.

```csharp
try
{
    // Code that might throw an exception
    int result = 10 / int.Parse("0");
}
catch (DivideByZeroException ex)
{
    // Handle specific exceptions first
    Console.WriteLine($"Cannot divide by zero: {ex.Message}");
}
catch (Exception ex)
{
    // Catch-all for any other exception
    Console.WriteLine($"An error occurred: {ex.Message}");
}
finally
{
    // This code ALWAYS runs, perfect for cleanup (closing files, DB connections)
    Console.WriteLine("Cleanup operation.");
}
```

### Exception Filters (`when`)
Introduced in C# 6, you can add conditions to catch blocks.
```csharp
catch (HttpRequestException ex) when (ex.StatusCode == HttpStatusCode.NotFound)
{
    Console.WriteLine("Resource not found.");
}
```

### Throwing Exceptions
Use the `throw` keyword to manually trigger an exception.
- `throw new ArgumentException("Invalid ID");`
- `throw;` (Inside a catch block, this re-throws the exception while **preserving the stack trace**).
- `throw ex;` (**AVOID THIS** as it resets the stack trace to the current line).

---

## 3. Defensive Programming: Parse vs. TryParse

Parsing strings into other types is one of the most common sources of exceptions.

### The Risky Way: `Parse()`
`int.Parse()` will throw a `FormatException` if the string is not a valid number. This is expensive and can crash your app.

### The Professional Way: `TryParse()`
`TryParse` returns a `bool` indicating success and uses an `out` parameter to return the value. It **never throws an exception** for invalid input.

```csharp
string input = "123a";

if (int.TryParse(input, out int result))
{
    Console.WriteLine($"Success! Number is: {result}");
}
else
{
    Console.WriteLine("Invalid input. Please enter a valid number.");
}
```

**Why use `TryParse`?**
1. **Performance**: Throwing and catching exceptions is slow.
2. **Safety**: It forces you to handle the "failure" case explicitly.
3. **Clean Code**: It avoids messy try-catch blocks for simple data validation.

---

## 4. Custom Exceptions

If built-in exceptions don't accurately describe your error, you can create your own.

```csharp
public class InsufficientFundsException : Exception
{
    public InsufficientFundsException(string message) : base(message) { }
}
```

---

## 🚀 Pro Tip: Global Error Handling
In professional applications, you shouldn't put a `try-catch` around every single line of code.
- **Console/Desktop**: Use `AppDomain.CurrentDomain.UnhandledException`.
- **Web (ASP.NET Core)**: Use **Global Exception Handling Middleware** (`UseExceptionHandler`) to catch all unhandled errors and return a clean JSON response to the client.
