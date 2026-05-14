# 02. Observability & Deployment

Moving from local development to a production-ready cloud environment.

---

## 1. Observability (The Three Pillars)
.NET Aspire makes observability easy:
1. **Logs**: Structured logs from all services in one view.
2. **Metrics**: Real-time performance counters (Requests/sec, Error rate).
3. **Traces**: Distributed tracing to follow a request through multiple microservices.

---

## 2. Distributed Tracing
When a request fails in Service B, but it was called by Service A, distributed tracing shows you the exact path. Aspire uses **OpenTelemetry** and provides a built-in dashboard for this.

---

## 3. Deployment with `azd`
The **Azure Developer CLI (`azd`)** is designed to take an Aspire application and deploy it to **Azure Container Apps** with a single command:
```bash
azd up
```
It handles creating the Container Registry, the Environment, and the App Service for you.

---

## 4. Scaling
Because Aspire applications are built using microservice principles, you can scale individual components (e.g., scale the `OrderService` to 5 instances during a sale) without scaling the entire app.

---

## 🚀 Pro Tip
Always check the **Aspire Dashboard** during development. It's the fastest way to find performance bottlenecks before they reach production.
