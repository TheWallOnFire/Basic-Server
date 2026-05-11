# 02. ASP.NET Core Basics

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
- **Transient**: Created every time they are requested.
- **Scoped**: Created once per client request (HTTP request).
- **Singleton**: Created once and shared throughout the app's lifetime.

## 4. Host & Kestrel
- **Kestrel**: The cross-platform web server for ASP.NET Core.
- **IIS/Nginx/Apache**: Usually used as a reverse proxy in front of Kestrel.
