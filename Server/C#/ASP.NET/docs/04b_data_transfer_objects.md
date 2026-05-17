# 04b. Data Transfer Objects (DTOs)

Data Transfer Objects (DTOs) are objects used to carry data between processes, specifically between your API endpoints and the clients calling them. 

---

## 1. The Golden Rule: Never Expose Your Database Entities
In ASP.NET Core, it is a massive anti-pattern to return your Entity Framework Core entities directly from your API controllers, or to accept them as parameters. **Always use DTOs.**

### Why?
1. **Security (Preventing Mass Assignment / Over-posting)**
   Imagine your `User` entity has an `IsAdmin` property. If you accept a `User` object directly in an update endpoint, a malicious user could send `{"Id": 1, "Name": "Hacker", "IsAdmin": true}`. If you save that directly to the database, you've just given them admin rights. DTOs solve this by only containing the properties the user is actually allowed to update.
2. **Decoupling (Versioning)**
   If your database schema changes (e.g., renaming a column from `FirstName` to `GivenName`), your API shouldn't break for external clients. DTOs act as a contract that isolates internal database changes from the external API representation.
3. **Performance (Over-fetching)**
   Your `User` entity might have relationships to `Orders`, `Posts`, and `Settings`. If you return the entity directly, the JSON serializer might try to serialize everything, sending megabytes of unnecessary data (or crashing with circular reference errors). DTOs ensure you only serialize exactly what the client asked for.

---

## 2. Records: The Best Way to Build DTOs
Since C# 9, **Records** are the preferred way to define DTOs. They are concise, immutable by default, and have value-based equality.

### Example: Traditional Class vs Record
**Old Way (Class):**
```csharp
public class UserCreateDto
{
    [Required]
    public string Username { get; set; }
    
    [EmailAddress]
    public string Email { get; set; }
}
```

**New Way (Record):**
```csharp
public record UserCreateDto(
    [Required] string Username, 
    [EmailAddress] string Email
);
```
*Note: Records are immutable. Once a `UserCreateDto` is created, its properties cannot be changed. This is perfect for DTOs because data flowing in and out of your API should not be mutated mid-flight.*

---

## 3. Mapping: Entities ↔ DTOs
To move data between your Database Entities and your DTOs, you need to map them.

### A. Manual Mapping (Recommended for Small Projects)
The most performant and error-free way is to write the mapping code yourself.
```csharp
// Entity to DTO
var dto = new UserDto(user.Id, user.Username, user.Email);

// DTO to Entity
var user = new User { Username = dto.Username, Email = dto.Email };
```
*Pro Tip: You can create extension methods to make this cleaner: `user.ToDto()`.*

### B. AutoMapper (Recommended for Large Projects)
When you have hundreds of models, manual mapping gets tedious. **AutoMapper** is a popular library that uses reflection to automatically map properties with matching names.

**Setup:**
```csharp
public class UserProfile : Profile
{
    public UserProfile()
    {
        CreateMap<User, UserDto>(); // Entity -> DTO
        CreateMap<UserCreateDto, User>(); // DTO -> Entity
    }
}
```

**Usage:**
```csharp
[HttpGet("{id}")]
public IActionResult GetUser(int id)
{
    var user = _dbContext.Users.Find(id);
    var dto = _mapper.Map<UserDto>(user);
    return Ok(dto);
}
```

### C. Mapster / Source Generators
If AutoMapper is too slow (because of Reflection), modern libraries like **Mapster** or source-generator-based mappers like **Mapperly** generate the manual mapping code for you at compile time, giving you the best of both worlds (speed and ease of use).

---

## 🚀 Pro Tip
Always use specific DTOs for specific actions. For example, have a `UserDto` for reading data, a `UserCreateDto` for creating data (without an ID), and a `UserUpdateDto` for updating data. Do not try to use one massive DTO for everything.
