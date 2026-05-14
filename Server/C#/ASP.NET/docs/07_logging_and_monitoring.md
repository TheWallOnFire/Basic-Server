# 07. Logging & Monitoring

Visibility is the difference between a minor incident and a disaster.

---

## 1. Structured Logging (Serilog)
Plain text logs are hard to search. **Structured logs** turn every log into a searchable object.
- **Instead of**: `"User 5 logged in"`
- **Use**: `{"UserId": 5, "Event": "Login", "Timestamp": "..."}`
- **Sinks**: You can send these logs to a database, a file, or services like **ElasticSearch** or **Application Insights**.

---

## 2. Health Checks
Health checks allow an external tool (like Kubernetes or a Load Balancer) to see if your app is "healthy."
- **Liveness**: Is the process running?
- **Readiness**: Can it reach the database and Redis?
```csharp
app.MapHealthChecks("/health");
```

---

## 3. Metrics (OpenTelemetry)
Metrics track the performance of your app over time.
- Request counts.
- Error rates.
- Average response time.
- CPU and Memory usage.

---

## 4. Diagnostics Tools
- **`dotnet-counters`**: A command-line tool to watch your app's performance in real-time.
- **`dotnet-dump`**: Capture the entire memory of the app to find memory leaks.

---

## 🚀 Pro Tip
Always log **Context**. A log that says "An error occurred" is useless. A log that says "User 123 failed to update Order 456 because of a Timeout" is a lifesaver.
