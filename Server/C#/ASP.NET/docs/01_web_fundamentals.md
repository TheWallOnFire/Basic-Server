# 01. Web Fundamentals

A deep understanding of how the web works is the foundation for building high-performance APIs with ASP.NET Core.

---

## 1. HTTP / HTTPS Protocol
HTTP is the "language" of the web. It is a **stateless**, request-response protocol.

### Statelessness vs. State Management
Statelessness means the server doesn't remember previous requests. We manage "state" using:
- **Cookies**: Small data stored on the client.
- **Sessions**: Data stored on the server linked to a cookie ID.
- **Tokens (JWT)**: Cryptographically signed data sent in the `Authorization` header.

### HTTP Verbs (The "What")
- **`GET`**: Read a resource. Should be **idempotent** (doing it twice doesn't change anything).
- **`POST`**: Create a new resource.
- **`PUT`**: Replace an entire resource.
- **`PATCH`**: Partial update of a resource.
- **`DELETE`**: Remove a resource.

### Status Codes (The "Result")
- **`1xx`**: Informational.
- **`2xx`**: Success (`200 OK`, `201 Created`).
- **`3xx`**: Redirection (`301 Moved Permanently`).
- **`4xx`**: Client Error (`400 Bad Request`, `401 Unauthorized`, `404 Not Found`).
- **`5xx`**: Server Error (`500 Internal Server Error`).

---

## 2. RESTful Architecture
REST (Representational State Transfer) is a set of constraints for building scalable web services.

- **Resources**: Everything is a resource with a unique URI (e.g., `/api/orders/42`).
- **Nouns vs Verbs**: Use `/api/orders` (Good) instead of `/api/getOrders` (Bad).
- **Representations**: Resources can be returned as JSON, XML, or HTML.

---

## 3. Data Serialization (JSON)
JSON is the universal language of modern APIs. In .NET, we have two main tools:

### System.Text.Json (Modern Standard)
Built into .NET, high performance, and minimal memory footprint.
```csharp
var json = JsonSerializer.Serialize(myObject);
var obj = JsonSerializer.Deserialize<MyClass>(jsonString);
```

### Newtonsoft.Json (Json.NET)
The community standard for years. It has more advanced features like handling circular references and complex custom converters.

---

## 4. The Request/Response Lifecycle
When a user clicks a button:
1. **DNS Lookup**: Find the server's IP address.
2. **TCP/TLS Handshake**: Secure connection established.
3. **HTTP Request**: Client sends headers and body.
4. **Middleware Pipeline**: ASP.NET Core processes the request (Auth, Logging, etc.).
5. **Controller Action**: Your code runs.
6. **HTTP Response**: Server sends data back to the client.

---

## 🚀 Pro Tip
Always use **HTTPS**. It's not just about security; modern features like HTTP/2 (which makes your site much faster) require it.
