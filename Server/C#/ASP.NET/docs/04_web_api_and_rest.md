# 04. Web API & REST

Building robust, documentable, and scalable APIs.

---

## 1. Controller Patterns
Use the `[ApiController]` attribute on your classes to enable:
- **Attribute Routing Requirement**: Must use `[Route]`.
- **Automatic Model Validation**: Returns 400 Bad Request automatically if inputs are wrong.
- **Problem Details**: Standardized error responses.

---

## 2. Routing Attributes & Constraints
In ASP.NET Core, routing attributes map incoming HTTP requests to specific methods. The string inside the attribute (e.g., `"{id}"`) defines a **Route Template**.

### What does `[HttpGet("{id}")]` do?
1. **`HttpGet`**: Tells the framework this method only responds to `GET` requests.
2. **`"{id}"`**: This is a route parameter. It captures a segment of the URL and maps it to a method parameter named `id`.
   - E.g., `GET /api/users/5` ➔ The `id` parameter becomes `5`.

### More Routing Examples & Constraints
You can add **Constraints** to route parameters to enforce data types or rules. If the constraint fails, the server returns a `404 Not Found` instead of crashing.

```csharp
[ApiController]
[Route("api/[controller]")] // Automatically becomes /api/users
public class UsersController : ControllerBase
{
    // 1. Basic Route Parameter
    // URL: GET /api/users/42
    [HttpGet("{id}")]
    public IActionResult GetUser(int id) { ... }

    // 2. Route Constraint (must be an integer)
    // URL: GET /api/users/42 (Works) | GET /api/users/abc (Returns 404)
    [HttpGet("{id:int}")]
    public IActionResult GetUserSafely(int id) { ... }

    // 3. Multiple Constraints (int, minimum value of 1)
    [HttpGet("{id:int:min(1)}")]
    public IActionResult GetValidUser(int id) { ... }

    // 4. Multiple Parameters in one route
    // URL: GET /api/users/42/posts/99
    [HttpGet("{userId}/posts/{postId}")]
    public IActionResult GetUserPost(int userId, int postId) { ... }

    // 5. Optional Parameters (using '?')
    // URL: GET /api/users/search OR /api/users/search/alice
    [HttpGet("search/{name?}")]
    public IActionResult SearchUser(string name = "Anonymous") { ... }

    // 6. Alpha constraint (letters only, min length 3)
    [HttpGet("category/{categoryName:alpha:minlength(3)}")]
    public IActionResult GetCategory(string categoryName) { ... }

    // 7. Default Values
    // URL: GET /api/users/profile OR /api/users/profile/alice
    [HttpGet("profile/{username=Guest}")]
    public IActionResult GetProfile(string username) { ... }

    // 8. Catch-All Route (matching paths with slashes)
    // URL: GET /api/users/files/docs/2024/report.pdf
    [HttpGet("files/{*filePath}")]
    public IActionResult GetFile(string filePath) { ... }
}
```

### Other HTTP Verbs
Routing attributes aren't just for `GET` requests. You map CRUD operations using specific HTTP verb attributes:
- **`[HttpPost]`**: For creating new resources.
- **`[HttpPut("{id}")]`**: For fully updating or replacing a resource.
- **`[HttpPatch("{id}")]`**: For partially updating a resource.
- **`[HttpDelete("{id}")]`**: For removing a resource.


---

## 3. Parameter Binding
Telling the framework where to look for data:
- **`[FromRoute]`**: ID or Slug in the URL (e.g., the `{id}` in `[HttpGet("{id}")]`).
- **`[FromQuery]`**: Filters or paging in the query string (`?page=2&sort=asc`).
- **`[FromBody]`**: Large JSON objects (usually for POST/PUT).
- **`[FromHeader]`**: API Keys or metadata.

---

---

## 4. Data Transfer Objects (DTOs)
**Never** expose your database entities directly to the API. 
1. **Security**: Prevent "Over-posting" attacks where a user updates a field they shouldn't (like `IsAdmin`).
2. **Versioning**: You can change your database without breaking the API.
3. **Performance**: Only send the data the client actually needs.

---

## 5. Action Results
Controllers should return `IActionResult` or `ActionResult<T>`. This allows you to return standard HTTP status codes easily using helper methods:
- `Ok(data)` ➔ 200 OK
- `Created(uri, data)` or `CreatedAtAction(...)` ➔ 201 Created
- `BadRequest(error)` ➔ 400 Bad Request
- `Unauthorized()` ➔ 401 Unauthorized
- `NotFound()` ➔ 404 Not Found
- `NoContent()` ➔ 204 No Content (typically used for successful `PUT` or `DELETE`)

---

## 6. Content Negotiation
You can strictly define what content types an endpoint expects or returns.
- **`[Consumes("application/json")]`**: Forces the endpoint to only accept JSON payloads.
- **`[Produces("application/json", "application/xml")]`**: States what formats the endpoint can return, improving Swagger documentation.

---

## 7. API Documentation (Swagger)
ASP.NET Core integrates with **Swashbuckle** to provide an interactive UI for your API.
- You can test endpoints directly in the browser.
- It generates an `openapi.json` file that other teams can use to generate their own client code.

---

## 8. Global Error Handling
Don't use `try-catch` in every controller. Use a **Global Exception Handler** or the **Developer Exception Page** to handle errors in one place and return a consistent JSON response.

---

## 🚀 Pro Tip
Always return the correct **HTTP Status Code**. Don't just return `200 OK` with an error message in the body. If it's not found, return `404`. If they aren't logged in, return `401`.
