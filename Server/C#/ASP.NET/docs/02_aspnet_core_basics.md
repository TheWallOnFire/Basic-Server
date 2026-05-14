# 02. ASP.NET Core Basics

ASP.NET Core is a cross-platform, high-performance, open-source framework for building modern, cloud-enabled, Internet-connected apps.

---

## 1. Minimal APIs vs. Controllers

### Controllers (The Traditional Way)
Uses classes and methods to organize routes. Best for complex applications with many related actions.
```csharp
[ApiController]
[Route("[controller]")]
public class UsersController : ControllerBase { ... }
```

### Minimal APIs (The Modern Way)
Introduced in .NET 6. Fast, lightweight, and perfect for microservices or simple APIs.
```csharp
var app = builder.Build();
app.MapGet("/users", () => new { Name = "John" });
```

---

## 2. Configuration System
ASP.NET Core uses a hierarchical configuration system.
1. **`appsettings.json`**: General settings.
2. **`appsettings.Development.json`**: Overrides for local dev.
3. **Environment Variables**: Best for production secrets and settings.
4. **User Secrets**: For local development secrets (stored outside the project folder).

---

## 3. Dependency Injection (Built-in)
The framework includes a first-class DI container. You register services in `Program.cs`.

- **Transient**: Created every time they are requested. (e.g., lightweight utility services).
- **Scoped**: Created once per client request (connection). (**The Standard** for DB Contexts).
- **Singleton**: Created once and shared for the entire lifetime of the app (e.g., Caching services).

---

## 4. The Middleware Pipeline
Middleware are components that handle the Request and Response. They are executed in the order they are defined.
```csharp
app.UseHttpsRedirection(); // Middleware 1
app.UseAuthentication();    // Middleware 2
app.UseAuthorization();     // Middleware 3
app.MapControllers();       // Middleware 4 (Terminal)
```

---

## 5. Hosting (Kestrel)
ASP.NET Core apps run on **Kestrel**, a high-performance cross-platform web server. In production, Kestrel is usually placed behind a **Reverse Proxy** like Nginx, Apache, or IIS for added security and load balancing.

---

## 🚀 Why This Matters
ASP.NET Core is designed to be **modular**. You only include the features you need, which makes the application faster and more secure. Understanding **Dependency Injection** is the most important step in becoming a professional .NET developer.
