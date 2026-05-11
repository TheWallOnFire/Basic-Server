# 01. C# Foundations

C# is a modern, object-oriented, and type-safe programming language that runs on the .NET runtime.

## 1. Syntax & Data Types
- **Value Types**: `int`, `double`, `bool`, `char`, `struct`, `enum`.
- **Reference Types**: `string`, `class`, `interface`, `delegate`, `array`.
- **Nullable Types**: `int?`, `string?` (using Reference Type Nullability).

## 2. Object-Oriented Programming (OOP)
- **Inheritance**: Reuse code from parent classes.
- **Polymorphism**: Overriding and Overloading.
- **Abstraction**: Interfaces and Abstract classes.
- **Encapsulation**: Using access modifiers (`public`, `private`, `protected`, `internal`).

## 3. Advanced Features
- **Generics**: `List<T>`, `Dictionary<TKey, TValue>`.
- **LINQ (Language Integrated Query)**: Querying collections using SQL-like syntax.
  ```csharp
  var adults = users.Where(u => u.Age >= 18).ToList();
  ```
- **Async/Await**: Non-blocking I/O operations.
- **Pattern Matching**: `if (obj is Person p)`, `switch` expressions.

## 4. .NET Ecosystem
- **.NET SDK**: Tools for building and running apps.
- **NuGet**: The package manager for .NET.
- **CLR (Common Language Runtime)**: The execution engine (JIT compilation, Garbage Collection).
