# 04. Web API & REST

Building robust, documentable, and scalable APIs.

---

## 1. Controller Patterns
Use the `[ApiController]` attribute on your classes to enable:
- **Attribute Routing Requirement**: Must use `[Route]`.
- **Automatic Model Validation**: Returns 400 Bad Request automatically if inputs are wrong.
- **Problem Details**: Standardized error responses.

---

## 2. Parameter Binding
Telling the framework where to look for data:
- **`[FromRoute]`**: ID or Slug in the URL.
- **`[FromQuery]`**: Filters or paging in the query string.
- **`[FromBody]`**: Large JSON objects (usually for POST/PUT).
- **`[FromHeader]`**: API Keys or metadata.

---

## 3. Data Transfer Objects (DTOs)
**Never** expose your database entities directly to the API. 
1. **Security**: Prevent "Over-posting" attacks where a user updates a field they shouldn't (like `IsAdmin`).
2. **Versioning**: You can change your database without breaking the API.
3. **Performance**: Only send the data the client actually needs.

---

## 4. API Documentation (Swagger)
ASP.NET Core integrates with **Swashbuckle** to provide an interactive UI for your API.
- You can test endpoints directly in the browser.
- It generates an `openapi.json` file that other teams can use to generate their own client code.

---

## 5. Global Error Handling
Don't use `try-catch` in every controller. Use a **Global Exception Handler** or the **Developer Exception Page** to handle errors in one place and return a consistent JSON response.

---

## 🚀 Pro Tip
Always return the correct **HTTP Status Code**. Don't just return `200 OK` with an error message in the body. If it's not found, return `404`. If they aren't logged in, return `401`.
