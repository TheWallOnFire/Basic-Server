# 04. Middleware & Dependency Injection

These two concepts are the core of how ASP.NET Core processes requests and manages services.

## 1. Middleware
Middleware is software that is assembled into an application pipeline to handle requests and responses.

### The Pipeline
```text
Request -> Middleware 1 -> Middleware 2 -> Middleware 3 -> Logic
                                                               |
Response <- Middleware 1 <- Middleware 2 <- Middleware 3 <- Logic
```
- Each component can choose to pass the request to the next component in the pipeline.
- Components can perform work both before and after the next component is invoked.
- **Common Middleware**: Authentication, Routing, CORS, Static Files, Exception Handling.

## 2. Dependency Injection (DI)
DI is a technique for achieving Inversion of Control (IoC) between classes and their dependencies.

### Benefits
- **Testability**: Easier to mock dependencies in unit tests.
- **Maintainability**: Changes in one part of the app don't ripple through everything.
- **Lifetime Management**: The framework handles when services are created and disposed.

### Service Lifetimes
1. **Transient**: `services.AddTransient<IMyService, MyService>();`
2. **Scoped**: `services.AddScoped<IMyService, MyService>();`
3. **Singleton**: `services.AddSingleton<IMyService, MyService>();`

## 3. Best Practices
- **Favor Constructor Injection**: It's the most common and cleanest way to inject services.
- **Avoid Service Locator Pattern**: Don't use `IServiceProvider` directly in your business logic.
- **Register Interfaces**: Always register the interface, not the concrete implementation.
