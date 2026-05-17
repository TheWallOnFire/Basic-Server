# 04d. The Microsoft.AspNetCore.Mvc Namespace

When building Web APIs or Web UIs in ASP.NET Core, almost everything you touch lives inside the `Microsoft.AspNetCore.Mvc` namespace. While developers often refer to it as a "class," it is actually a **namespace** containing hundreds of classes, interfaces, and attributes that form the core of the framework.

Here is a breakdown of the most critical components you will use daily.

---

## 1. Controller Base Classes

ASP.NET Core provides base classes that give you access to the HTTP context, request/response objects, and helper methods.

### `ControllerBase` (For Web APIs)
If you are building a REST API, your controllers should inherit from `ControllerBase`. It provides everything you need to handle HTTP requests and return JSON.
```csharp
using Microsoft.AspNetCore.Mvc;

public class UsersController : ControllerBase { }
```

### `Controller` (For Web UIs - MVC/Razor)
If you are building a traditional website that returns HTML views, you inherit from `Controller`. It inherits from `ControllerBase` but adds methods like `View()` and `ViewBag`.
```csharp
public class HomeController : Controller 
{
    public IActionResult Index() => View(); // Returns an HTML page
}
```

---

## 2. Core Attributes

Attributes in this namespace tell the framework how to treat your classes and parameters.

### `[ApiController]`
Applied to a controller class. It enables API-specific behaviors:
- **Automatic Model Validation**: If a client sends bad data, it automatically returns a `400 Bad Request` without you having to write `if (!ModelState.IsValid)`.
- **Requirement for Attribute Routing**: It forces you to use `[Route("...")]` on the controller.

### Routing Attributes
Map HTTP requests to specific methods.
- `[Route("api/[controller]")]`
- `[HttpGet]`, `[HttpPost]`, `[HttpPut]`, `[HttpDelete]`, `[HttpPatch]`

### Parameter Binding Attributes
Tell the framework exactly *where* to find the data in the HTTP request.
- `[FromRoute]`: Extract from the URL path (e.g., `/api/users/5`).
- `[FromQuery]`: Extract from the URL query string (e.g., `?sort=asc`).
- `[FromBody]`: Extract from the JSON body (used in POST/PUT).
- `[FromHeader]`: Extract from HTTP headers (e.g., `Authorization`).

---

## 3. Action Results (Returning Data)

Methods inside a controller are called "Actions." They need to return an HTTP response. The MVC namespace provides interfaces and helper methods for this.

### `IActionResult`
An interface representing the result of an action. Helper methods on `ControllerBase` implement this interface.
- `Ok(data)` ➔ Returns `200 OK` with JSON data.
- `NotFound()` ➔ Returns `404 Not Found`.
- `BadRequest(error)` ➔ Returns `400 Bad Request`.

### `ActionResult<T>`
A generic version of `IActionResult`. It is highly recommended because it allows Swagger/OpenAPI to know exactly what type of data your API returns.
```csharp
[HttpGet("{id}")]
public ActionResult<UserDto> GetUser(int id)
{
    var user = _db.Users.Find(id);
    if (user == null) return NotFound();
    
    return Ok(user); // Implicitly converted to ActionResult<UserDto>
}
```

---

## 4. Filters (Advanced Request Interception)

The MVC namespace provides a "Filter Pipeline" that allows you to run code before or after specific stages in the request processing.

- **Authorization Filters**: Run first to check if the user is allowed.
- **Resource Filters**: Good for caching. They run right after authorization.
- **Action Filters (`IActionFilter`)**: Run immediately before and after the controller action method executes. Useful for manipulating arguments or the result.
- **Exception Filters (`IExceptionFilter`)**: Used to catch unhandled exceptions and format them into standardized JSON error responses.

---

## 🚀 Pro Tip
Whenever you are searching for how to handle HTTP requests, return specific status codes, or bind incoming data, you are looking for features inside `Microsoft.AspNetCore.Mvc`. If your controller isn't recognizing `[HttpGet]` or `Ok()`, make sure you have `using Microsoft.AspNetCore.Mvc;` at the top of your file!
