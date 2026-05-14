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

## 3. Advanced Language Features
- **Generics**: Create reusable classes/methods with `List<T>`, `Dictionary<TKey, TValue>`.
- **LINQ (Language Integrated Query)**: Querying collections using SQL-like syntax.
  ```csharp
  var adults = users.Where(u => u.Age >= 18).OrderBy(u => u.Name).ToList();
  ```
- **Async/Await**: The TPL (Task Parallel Library) for non-blocking I/O.
- **Delegates & Lambdas**: Type-safe function pointers (`Func<T>`, `Action<T>`).
- **Events**: A way for classes to provide notifications (standard in UI and observer patterns).
- **Attributes**: Metadata that can be queried at runtime using Reflection.
- **Reflection**: Inspecting and interacting with types at runtime.

## 4. Memory Management & Performance
- **Garbage Collection (GC)**: Automatic memory management with Generations (0, 1, 2).
- **Value Types vs. Reference Types**: Understanding the Stack vs. the Heap.
- **Span<T> and Memory<T>**: High-performance, allocation-free memory access.
- **IDisposable**: Explicitly releasing unmanaged resources (using the `using` statement).

## 5. .NET Ecosystem
- **.NET SDK**: Tools for building and running apps (`dotnet build`, `dotnet run`).
- **NuGet**: The centralized package manager for .NET.
- **CLR (Common Language Runtime)**: The virtual machine that handles execution, JIT, and GC.
