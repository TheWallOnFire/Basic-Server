# 01. C# Foundations

C# (C-Sharp) is a modern, object-oriented, and type-safe programming language. It is the primary language for building applications on the **.NET** platform.

---

## 1. Syntax & Data Types
C# is a "strongly typed" language, meaning every variable and constant has a type.

### Value Types (Stored on the Stack)
Value types hold the actual data. They are generally faster to access.
- **Simple Types**: `int` (32-bit), `long` (64-bit), `float`, `double`, `decimal` (high precision for money), `bool` (`true`/`false`), `char`.
- **Structs**: Lightweight objects like `DateTime` or custom `Point`.
- **Enums**: Named constants (e.g., `enum Status { Active, Inactive }`).

### Reference Types (Stored on the Heap)
Reference types store a "reference" (pointer) to the actual data.
- **`string`**: An immutable sequence of characters.
- **`class`**: The fundamental building block of OOP.
- **`interface`**: A contract that classes implement.
- **`array`**: A collection of items of the same type.

### Nullable Types
By default, value types cannot be `null`. Reference types can be `null`.
- `int? age = null;` // Allowed because of the `?`
- `string? name = null;` // Explicitly allowing null for a string (NRT - Nullable Reference Types).

---

## 2. Object-Oriented Programming (OOP)
C# was built from the ground up as an OOP language.

### A. Inheritance
Allows you to create new classes that reuse, extend, and modify the behavior defined in other classes.
```csharp
public class Animal { public void Eat() => Console.WriteLine("Eating..."); }
public class Dog : Animal { public void Bark() => Console.WriteLine("Bark!"); }
```

### B. Polymorphism
"Many shapes." A single method name can behave differently depending on the object.
- **Static (Overloading)**: Multiple methods with the same name but different parameters.
- **Dynamic (Overriding)**: A child class providing a specific implementation of a method defined in its parent using `virtual` and `override`.

### C. Abstraction
Hiding complex implementation details and showing only the necessary features of an object.
- **Interfaces**: Define *what* a class should do, but not *how*.
- **Abstract Classes**: Classes that cannot be instantiated and may contain partial implementations.

### D. Encapsulation
Protecting the internal state of an object by restricting access to members. Use **Access Modifiers**:
- `public`: Accessible from anywhere.
- `private`: Accessible only within the same class.
- `protected`: Accessible within the class and its children.
- `internal`: Accessible within the same assembly (.dll/.exe).

---

## 3. Properties and Auto-Properties
Properties provide a flexible mechanism to read, write, or compute the value of a private field.
```csharp
public class User
{
    private string _name; // Field
    public string Name // Property
    {
        get => _name;
        set => _name = value ?? "Unknown";
    }
    
    public int Age { get; set; } // Auto-property
}
```

---

## 4. Memory Management: Stack vs. Heap
- **The Stack**: Used for static memory allocation and thread execution. It's fast and automatically managed. Value types and method calls live here.
- **The Heap**: Used for dynamic memory allocation. Objects (Reference types) live here. It is managed by the **Garbage Collector (GC)**.

### Garbage Collection (GC)
The GC automatically identifies objects on the heap that are no longer being used and reclaims their memory. It works in "Generations" (0, 1, and 2) to optimize performance by focusing on short-lived objects first.

---

## 5. Control Flow
- **Conditional**: `if`, `else if`, `else`, and the modern `switch` expression.
- **Loops**: `for`, `foreach` (the standard for collections), `while`, and `do-while`.
- **Exception Handling**: `try`, `catch`, `finally`, and `throw`.

---

## 🚀 Why This Matters
Understanding these foundations is the difference between writing "code that works" and "code that is professional." Proper use of **Encapsulation** and **Polymorphism** makes your code maintainable, while understanding the **Stack and Heap** helps you avoid performance bottlenecks.
