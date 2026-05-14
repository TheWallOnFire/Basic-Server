# 05. Common Design Patterns in C#

Design patterns are proven solutions to common software design problems. Using them makes your code more flexible, reusable, and maintainable.

---

## 1. Creational Patterns (Object Creation)

### A. Singleton
Ensures a class has only one instance and provides a global point of access to it.
- **Usage**: Database connections, Load balancers, Configuration settings.
```csharp
public sealed class DatabaseConnection
{
    private static readonly DatabaseConnection _instance = new();
    public static DatabaseConnection Instance => _instance;
    private DatabaseConnection() { } // Private constructor
}
```

### B. Factory Method
Defines an interface for creating an object but lets subclasses decide which class to instantiate.
- **Usage**: When you don't know the exact type of object you need until runtime.

### C. Builder
Separates the construction of a complex object from its representation.
- **Usage**: Creating objects with many optional parameters (e.g., a `HttpRequestMessage`).

---

## 2. Structural Patterns (Object Relationships)

### A. Adapter
Allows incompatible interfaces to work together. It acts as a "wrapper" or "bridge."
- **Usage**: Integrating a third-party library that doesn't match your internal interface.

### B. Decorator
Adds behavior to an object dynamically without modifying its code.
- **Usage**: Adding Logging, Encryption, or Caching to a service.

### C. Proxy
Provides a placeholder for another object to control access to it.
- **Usage**: Lazy loading, access control, or logging.

---

## 3. Behavioral Patterns (Object Communication)

### A. Strategy
Defines a family of algorithms, encapsulates each one, and makes them interchangeable at runtime.
- **Usage**: Sorting algorithms, Payment methods (PayPal vs Credit Card).
```csharp
public interface IPaymentStrategy { void Pay(decimal amount); }
public class CreditCardPayment : IPaymentStrategy { ... }
public class PayPalPayment : IPaymentStrategy { ... }
```

### B. Observer
Defines a one-to-many dependency so that when one object changes state, all its dependents are notified.
- **Usage**: Push notifications, UI event handling.

### C. Repository Pattern
Mediates between the domain and data mapping layers. It mimics an in-memory collection of objects.
- **Usage**: Hiding EF Core details from your business logic.

---

## 4. SOLID Principles (The Foundation)
These five principles are the "North Star" of good object-oriented design.

1. **Single Responsibility (SRP)**: A class should have only one reason to change.
2. **Open/Closed (OCP)**: Software entities should be open for extension but closed for modification.
3. **Liskov Substitution (LSP)**: Derived classes must be substitutable for their base classes.
4. **Interface Segregation (ISP)**: Clients should not be forced to depend on methods they do not use.
5. **Dependency Inversion (DIP)**: Depend on abstractions, not concretions (The basis for **Dependency Injection**).

---

## 🚀 Pro Tip
Don't try to use every pattern at once. Patterns should be used to solve a specific problem, not just for the sake of using them. Start with **Strategy** and **Singleton**, as they are the most common in modern .NET development.
