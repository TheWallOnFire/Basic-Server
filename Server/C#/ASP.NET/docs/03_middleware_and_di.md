# 03. Middleware & Dependency Injection

These two patterns are the "engine" of any ASP.NET Core application.

---

## 1. Middleware Deep Dive
Middleware is code that sits between the incoming request and the final response.

### How the Pipeline Works
Each middleware has two choices:
1. Process the request and pass it to the **next** component.
2. Short-circuit the request and return a response immediately (e.g., an Authentication middleware failing a request).

### Custom Middleware
You can write your own logic to run on every request (like custom logging or headers).
```csharp
app.Use(async (context, next) => {
    // Code before the next middleware
    await next.Invoke();
    // Code after the next middleware
});
```

---

## 2. Dependency Injection (DI)
DI is a design pattern that removes hard-coded dependencies by "injecting" them into a class.

### Why use DI?
- **Testability**: You can inject "Mock" objects during testing.
- **Maintainability**: Changing a service implementation doesn't require changing the classes that use it.
- **Cleanup**: The container automatically disposes of services when they are no longer needed.

### Constructor Injection (The Best Practice)
```csharp
public class UserService
{
    private readonly IRepository _repo;
    public UserService(IRepository repo) // Injected by the framework
    {
        _repo = repo;
    }
}
```

---

## 3. Service Lifetimes
Choosing the right lifetime is critical for memory management and thread safety.

| Lifetime | Description | Typical Use Case |
| :--- | :--- | :--- |
| **Transient** | Created every time they are requested. | Small, stateless utility classes. |
| **Scoped** | Created once per HTTP request. | Database Contexts (EF Core). |
| **Singleton** | Created once and shared globally. | Configuration, In-memory Caches. |

---

## 🚀 Pro Tip
Never use `new` for your services. Always register them in the DI container and inject them. This ensures your app stays decoupled and easy to test.
