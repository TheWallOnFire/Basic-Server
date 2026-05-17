# 🗺️ .NET Developer Roadmap

This roadmap is split into two parts: **C# Language Mastery** and **ASP.NET Core Framework Mastery**.

---

## 📘 Part 1: C# Language & Design Patterns

### 🟢 Foundations
0. **[The .NET Ecosystem](./00_dotnet_ecosystem.md)**: Evolution and CLR internals.
1. **[C# Fundamentals](./01_csharp_foundations.md)**: Syntax, Types, and OOP.
1b. **[Error Handling & Parsing](./01_error_handling.md)**: Exceptions and TryParse.
1c. **[Collections & Data Structures](./01c_collections_data_structures.md)**: List, Dictionary, and HashSet.
2. **[C# Deep Dive](./02_csharp_deep_dive.md)**: [Attributes & Reflection](./02_attributes_and_reflection.md), Delegates, and Generics.
2b. **[LINQ & Deferred Execution](./02b_linq_and_deferred_execution.md)**: Query syntax, Deferred Execution, IQueryable vs IEnumerable.

### 🟡 Quality & Architecture
3. **[Testing Foundations](./03_testing_foundations.md)**: Unit testing and Mocking.
4. **[Clean Architecture](./04_design_patterns_clean_arch.md)**: Onion Architecture and CQRS.
5. **[Common Design Patterns](./05_common_design_patterns.md)**: Singleton, Strategy, and SOLID.

---

## 🌐 Part 2: ASP.NET Core Framework

### 🟢 Web Foundations
6. **[Web Basics](../ASP.NET/docs/01_web_fundamentals.md)**: HTTP, REST, and JSON.
7. **[ASP.NET Core Basics](../ASP.NET/docs/02_aspnet_core_basics.md)**: MVC, Razor Pages, and Minimal APIs.
8. **[Middleware & DI](../ASP.NET/docs/03_middleware_and_di.md)**: The request pipeline.

### 🟡 Building APIs & Data
9. **[Web API & REST](../ASP.NET/docs/04_web_api_and_rest.md)**: Controllers and Swagger.
9b. **[Data Transfer Objects (DTOs)](../ASP.NET/docs/04b_data_transfer_objects.md)**: Security, AutoMapper, and Records.
9c. **[HTTP Methods & HttpClient](../ASP.NET/docs/04c_http_methods_and_client.md)**: Verbs, IHttpClientFactory, and Typed Clients.
9d. **[The MVC Namespace](../ASP.NET/docs/04d_mvc_namespace_deep_dive.md)**: ControllerBase, IActionResult, and Filters.
10. **[Entity Framework Core](../ASP.NET/docs/05_entity_framework_core.md)**: Modern ORM.

### 🟠 Advanced Operations
11. **[Caching & Performance](../ASP.NET/docs/06_caching_and_performance.md)**: Scaling with Redis.
12. **[Logging & Monitoring](../ASP.NET/docs/07_logging_and_monitoring.md)**: Actuator and Serilog.
13. **[Real-time SignalR](../ASP.NET/docs/08_realtime_signalr.md)**: WebSockets and Hubs.
14. **[Microservices](../ASP.NET/docs/09_microservices_architecture.md)**: Docker and API Gateways.

---

## 🚀 Part 3: Framework Expansion Tracks

Once you master the core framework, you can specialize in these advanced paths:

### 🎨 Web UI with Blazor
- **[Blazor Basics](../Blazor/docs/01_blazor_basics.md)**: Hosting models and Components.
- **[Components & State](../Blazor/docs/02_components_and_state.md)**: Lifecycle and JS Interop.
- **[Forms & Validation](../Blazor/docs/03_forms_and_validation.md)**: User input and EditForm.
- **[Blazor Security](../Blazor/docs/04_blazor_security.md)**: Auth and AuthorizeView.

### 📱 Multi-platform (MAUI)
- **[MAUI Foundations](../MAUI/docs/01_maui_foundations.md)**: Cross-platform mobile and desktop.
- **[Layouts & Navigation](../MAUI/docs/02_layouts_and_navigation.md)**: Shell and Responsive UI.
- **[Native Features & MVVM](../MAUI/docs/03_native_features_and_mvvm.md)**: Native APIs and Patterns.

### ☁️ Cloud-Native (.NET Aspire)
- **[.NET Aspire Basics](../CloudNative/docs/01_dotnet_aspire.md)**: Modern microservice orchestration.
- **[Observability & Deployment](../CloudNative/docs/02_observability_and_deployment.md)**: Monitoring and Azure CLI.

---

## 🚀 Final Tip
Master the **Language** first, then the **Core Framework** (ASP.NET & EF Core). Once you have those foundations, picking up **Blazor**, **MAUI**, or **Aspire** will be much faster and easier.
