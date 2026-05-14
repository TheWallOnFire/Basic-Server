# 01. Blazor Basics

Blazor allows you to build interactive web UIs using C# instead of JavaScript. It shares the same component model as ASP.NET Core Razor Pages but adds client-side interactivity.

---

## 1. Blazor Hosting Models
Blazor has two primary ways to run:

### A. Blazor WebAssembly (WASM)
The application, its dependencies, and the .NET runtime are downloaded to the browser.
- **Pros**: Runs entirely on the client, works offline, no server-side load.
- **Cons**: Larger initial download size.

### B. Blazor Server
The application is executed on the server. UI updates, event handling, and JavaScript calls are handled over a **SignalR** connection.
- **Pros**: Fast initial load, full access to server-side resources.
- **Cons**: Requires a constant connection to the server.

### C. Blazor Web App (.NET 8+)
A unified model that allows you to mix and match Server and WASM rendering on a per-component or per-page basis.

---

## 2. Razor Components
The building block of Blazor. They are files with a `.razor` extension.
```razor
@page "/counter"

<h1>Counter</h1>
<p>Current count: @currentCount</p>

<button class="btn btn-primary" @onclick="IncrementCount">Click me</button>

@code {
    private int currentCount = 0;
    private void IncrementCount() => currentCount++;
}
```

---

## 3. Data Binding
- **One-way**: `@myValue`
- **Two-way**: `<input @bind="myValue" />`

---

## 4. Dependency Injection
Blazor uses the same DI system as ASP.NET Core. You can inject services directly into components using the `@inject` directive.
```razor
@inject IUserService UserService
```

---

## 🚀 Pro Tip
Use **Blazor Web App** in .NET 8. It provides the best of both worlds by allowing you to choose the "Render Mode" (Static, Server, or WASM) for each part of your application.
