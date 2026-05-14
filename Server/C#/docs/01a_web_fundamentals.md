# 01a. Web Fundamentals in .NET

Before diving into ASP.NET Core, it's essential to understand the underlying web protocols and data formats.

## 1. HTTP / HTTPS
- **Statelessness**: Every request is independent. State is managed via Cookies, Sessions, or Tokens (JWT).
- **Verbs**:
  - `GET`: Retrieve data.
  - `POST`: Create data.
  - `PUT`: Update data (replace).
  - `PATCH`: Update data (partial).
  - `DELETE`: Remove data.
- **Status Codes**:
  - `2xx`: Success (200 OK, 201 Created).
  - `4xx`: Client Error (400 Bad Request, 401 Unauthorized, 404 Not Found).
  - `5xx`: Server Error (500 Internal Server Error).

## 2. RESTful Principles
REST (Representational State Transfer) is an architectural style for designing networked applications.
- **Resources**: Identified by URIs (e.g., `/api/users/1`).
- **Nouns over Verbs**: Use `/api/products` instead of `/api/getAllProducts`.
- **HATEOAS**: Providing links to related resources (optional but recommended).

## 3. JSON Handling in C#
JSON is the standard format for Web APIs.

### System.Text.Json (Built-in)
Highly performant and recommended for modern apps.
```csharp
using System.Text.Json;

var user = new { Name = "John", Age = 30 };
string json = JsonSerializer.Serialize(user);
var deserializedUser = JsonSerializer.Deserialize<User>(json);
```

### Newtonsoft.Json (Json.NET)
The legacy standard with more features and flexibility. Still widely used in older or complex projects.

## 4. Middleware & The Request Lifecycle
In ASP.NET Core, every request passes through a "Pipeline" of middleware components before reaching your Controller or Minimal API endpoint. This is where cross-cutting concerns like logging and auth happen.
