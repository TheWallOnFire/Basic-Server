# 10. Caching & Performance

Caching is one of the most effective ways to improve application performance and scalability.

## 1. In-Memory Caching
Stores data in the web server's local memory. Simple but not suitable for multi-server (load-balanced) environments.
```csharp
builder.Services.AddMemoryCache();
// Injected as IMemoryCache
```

## 2. Distributed Caching (Redis)
Stores data in an external service (like Redis), making it accessible to all instances of your application.
```csharp
builder.Services.AddStackExchangeRedisCache(options => {
    options.Configuration = "localhost";
    options.InstanceName = "SampleInstance";
});
```

## 3. Response Caching
Middleware that caches the entire HTTP response based on cache headers.
- **Client-side**: Using `Cache-Control` headers.
- **Server-side**: Using `AddResponseCaching()`.

## 4. Output Caching (.NET 7+)
A more powerful server-side caching mechanism that allows for fine-grained control over cache invalidation and storage.
```csharp
app.MapGet("/products", () => ...).CacheOutput();
```

## 5. Performance Tips
- **Async Everything**: Use `async/await` to free up thread pool threads.
- **Avoid Large Object Heap (LOH)**: Be careful with large arrays or strings (>85KB).
- **BenchmarkDotNet**: Use this library to measure code performance accurately.
- **Profiling**: Use tools like `dotnet-counters` and `Visual Studio Profiler`.
