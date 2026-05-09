# C# / .NET Core Concepts for Web Development

## 1. The .NET Ecosystem
- **.NET Framework**: The original Windows-only framework.
- **.NET Core / .NET 5+**: The modern, cross-platform, open-source successor. All new projects should use this.
- **ASP.NET Core**: The web framework built on top of .NET for building web APIs and web apps.

## 2. Middleware Pipeline
ASP.NET Core processes requests through a middleware pipeline, similar to Express.js:
```csharp
app.UseHttpsRedirection();
app.UseAuthentication();
app.UseAuthorization();
app.MapControllers();
```

## 3. Dependency Injection (Built-in)
.NET has a first-class DI container:
```csharp
builder.Services.AddScoped<IUserService, UserService>();
```
Services can be registered as Transient (new each time), Scoped (per request), or Singleton (one instance).

## 4. Entity Framework Core (EF Core)
The official ORM for .NET. Supports Code-First and Database-First approaches:
```csharp
public class User {
    public int Id { get; set; }
    public string Name { get; set; }
    public string Email { get; set; }
}
```

## 5. Minimal APIs vs. Controllers
- **Controllers**: The traditional MVC pattern with `[ApiController]` attribute.
- **Minimal APIs** (C# 10+): Lightweight, Express-like routing:
```csharp
app.MapGet("/hello", () => "Hello World!");
```

## 6. Blazor
Build interactive web UIs using C# instead of JavaScript:
- **Blazor Server**: UI logic runs on the server, updates sent via SignalR.
- **Blazor WebAssembly**: C# code compiled to WebAssembly and runs in the browser.
