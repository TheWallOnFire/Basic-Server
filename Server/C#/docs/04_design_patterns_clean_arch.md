# 04. Design Patterns: Clean Architecture

Clean Architecture (also known as Onion Architecture) is a way of organizing your project so that it is easy to maintain, test, and adapt to changes in the future.

---

## 1. The Core Idea: Dependency Rule
The most important rule in Clean Architecture is that **Dependencies point inwards**. 
Inner layers know nothing about outer layers.

### The Layers
1. **Domain (Center)**: The "Heart" of the system. Contains Entities, Value Objects, and Domain Logic. It has **Zero** dependencies on other layers or libraries.
2. **Application**: Contains the business "Use Cases" (e.g., `RegisterUser`, `ProcessPayment`). It depends only on the Domain.
3. **Infrastructure**: Concrete implementations of external concerns like Database (EF Core), File System, Email service, or External APIs.
4. **Presentation**: The entry point. This could be an ASP.NET Core Web API, a Blazor app, or a Console app.

---

## 2. CQRS (Command Query Responsibility Segregation)
CQRS is a pattern that separates the code that **Reads** data from the code that **Writes** data.

- **Commands**: Operations that change state (Create, Update, Delete). They return `void` or a status.
- **Queries**: Operations that retrieve data (Get, List). They return a result but do NOT change state.

### Why use CQRS?
- **Performance**: You can optimize your read database separately from your write database.
- **Security**: Different permissions for reading vs writing.
- **Simplicity**: No more complex objects that handle both data entry and complex reporting.

### MediatR
In the .NET world, **MediatR** is the most common library used to implement CQRS. It decouples the "Request" (Command/Query) from its "Handler."

---

## 3. Dependency Inversion Principle (DIP)
This is the "D" in SOLID. It states that high-level modules (Application) should not depend on low-level modules (Infrastructure). Both should depend on **Abstractions** (Interfaces).

**Example**:
- **Bad**: `UserService` directly uses `SqlDatabase`. (If you change DB, you must change `UserService`).
- **Good**: `UserService` uses `IRepository`. `SqlDatabase` implements `IRepository`. `UserService` doesn't care *how* data is stored.

---

## 4. When to use Clean Architecture?
- **Small Apps**: Probably overkill. Use a simple layered (N-Tier) architecture.
- **Large/Enterprise Apps**: Essential. It prevents the "Big Ball of Mud" where everything is tangled together.

---

## 🚀 Pro Tip
Start by moving your Entities into a separate **Domain** project with no references. This one move will force you to write better, more decoupled code.
