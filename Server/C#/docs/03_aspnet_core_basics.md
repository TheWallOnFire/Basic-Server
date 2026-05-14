# 03. ASP.NET Core Basics

ASP.NET Core is the cross-platform, high-performance framework for building modern, cloud-based, Internet-connected applications.

## 1. Application Models
- **MVC (Model-View-Controller)**: The traditional way of building web apps with separation of concerns.
- **Razor Pages**: A page-based model that makes building UI-focused apps easier.
- **Minimal APIs**: A lightweight approach for building APIs with minimal ceremony (new in .NET 6).
  ```csharp
  var builder = WebApplication.CreateBuilder(args);
  var app = builder.Build();
  app.MapGet("/", () => "Hello World!");
  app.Run();
  ```

## 2. Startup & Configuration
- **Program.cs**: The entry point where the application is configured and built.
- **AppSettings.json**: The primary location for configuration strings and app settings.
- **Environment Variables**: Overriding settings for Production/Staging.

## 3. Dependency Injection (DI)
ASP.NET Core has built-in support for DI.
- **Transient**: Created every time they are requested (Good for lightweight services).
- **Scoped**: Created once per HTTP request (Standard for DB contexts).
- **Singleton**: Created once and shared throughout the app (Good for caching/state).

## 4. Filters & Pipelines
Filters allow you to run code before or after specific stages in the request processing pipeline.
- **Authorization Filters**: Controls access.
- **Action Filters**: Runs before/after a controller action (Good for validation/logging).
- **Exception Filters**: Global handling of unhandled exceptions.

## 5. Routing
- **Attribute Routing**: `[Route("api/[controller]")]` directly on controllers.
- **Conventional Routing**: Defined in `Program.cs` for MVC apps.
- **Route Constraints**: `[HttpGet("{id:int}")]` to restrict parameter types.

## 6. Authentication & Authorization
- **ASP.NET Core Identity**: A full membership system (Login, Roles, Tokens).
- **JWT (JSON Web Tokens)**: Standard for securing Web APIs.
- **Policy-based Authorization**: Defining complex rules (e.g., "Must be 18 and have Admin role").

## 7. Web Server: Kestrel
- **Kestrel**: High-performance, cross-platform server.
- **Reverse Proxy**: Usually used with Nginx or IIS for SSL termination and load balancing.
