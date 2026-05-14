# 09. Logging & Monitoring

Logging is the "eyes and ears" of your application in production.

## 1. ILogger Interface
ASP.NET Core provides a built-in logging abstraction (`ILogger`).
```csharp
public class MyService
{
    private readonly ILogger<MyService> _logger;

    public MyService(ILogger<MyService> logger)
    {
        _logger = logger;
    }

    public void DoWork()
    {
        _logger.LogInformation("Doing work at {Time}", DateTime.UtcNow);
    }
}
```

## 2. Structured Logging
Unlike plain text logs, structured logs treat log data as searchable objects.
- **Good**: `_logger.LogInformation("User {UserId} logged in", userId);`
- **Bad**: `_logger.LogInformation($"User {userId} logged in");` (Interpolated strings break searchability).

## 3. Serilog
The community standard for structured logging in .NET. It supports "Sinks" to send logs to:
- Console
- Files
- Seq / ElasticSearch / Application Insights
- Databases

## 4. Log Levels
- **Trace**: Very detailed logs (development only).
- **Debug**: Helpful for debugging.
- **Information**: Normal application flow.
- **Warning**: Abnormal but non-breaking events.
- **Error**: Exceptions or failures that need attention.
- **Critical**: System-wide failures.

## 5. Health Checks
Built-in middleware to expose an endpoint (e.g., `/health`) that tells monitoring tools if the app is alive and its dependencies (DB, Redis) are reachable.
```csharp
builder.Services.AddHealthChecks();
app.MapHealthChecks("/health");
```
