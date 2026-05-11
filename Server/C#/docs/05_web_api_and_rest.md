# 05. Web API & REST

Building APIs is one of the most common uses of ASP.NET Core.

## 1. Controllers
Controllers are used to group related API endpoints.
```csharp
[ApiController]
[Route("api/[controller]")]
public class UsersController : ControllerBase
{
    [HttpGet]
    public IActionResult GetUsers() { ... }
}
```

## 2. Minimal APIs
A high-performance, low-boilerplate alternative to controllers.
```csharp
app.MapGet("/users", (IUserService service) => service.GetAll());
```

## 3. Data Transfer Objects (DTOs)
Never expose your database entities directly to the API. Use DTOs to shape the data for the client.
- **AutoMapper**: A popular library for mapping entities to DTOs.

## 4. Documentation (Swagger/OpenAPI)
ASP.NET Core has built-in support for Swagger (Swashbuckle), which provides a UI for testing and documenting your API.

## 5. RESTful Principles
- **HTTP Verbs**: `GET` (Read), `POST` (Create), `PUT`/`PATCH` (Update), `DELETE` (Delete).
- **Status Codes**: `200 OK`, `201 Created`, `400 Bad Request`, `401 Unauthorized`, `404 Not Found`, `500 Internal Server Error`.
- **Content Negotiation**: Supporting multiple formats like JSON and XML.
