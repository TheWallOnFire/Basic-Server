# ASP.NET

## Description
ASP.NET Core is a cross-platform, high-performance, open-source framework for building modern, cloud-enabled, Internet-connected apps. It is built and maintained by Microsoft and the open-source community.

## How it works
ASP.NET Core uses a high-performance web server called Kestrel. When a request hits the server, it passes through a pipeline of middleware components. Each piece of middleware can handle the request or pass it to the next component. It relies heavily on Dependency Injection and is highly modular, allowing developers to include only the necessary packages.

## How to code it
Here is a basic example of an ASP.NET Core minimal API (C# 10+):

```csharp
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/", () => "Hello World from ASP.NET Core!");

app.Run();
```

## Features it supports
- Cross-platform support (Windows, macOS, Linux)
- Unified story for building web UI and web APIs
- Dependency Injection built-in
- Blazor: allows building interactive client-side web UI with C# instead of JavaScript
- Extremely fast performance (often topping TechEmpower benchmarks)

## Real projects about it
- **Stack Overflow**: Runs heavily on ASP.NET technologies.
- **Tencent**: Uses ASP.NET Core for some high-performance services.
- **Microsoft**: Naturally, uses it across their cloud and web offerings (Azure, Xbox Live).
