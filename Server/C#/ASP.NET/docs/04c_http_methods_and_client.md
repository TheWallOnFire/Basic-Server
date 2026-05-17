# 04c. HTTP Methods & HttpClient

Understanding HTTP methods is crucial for building RESTful APIs, and knowing how to *call* those APIs efficiently from C# is just as important.

---

## 1. HTTP Methods (Server-Side ASP.NET)
ASP.NET Core uses attributes to map incoming HTTP requests to controller actions. Each method has a specific semantic meaning in REST architecture.

### The Core CRUD Verbs
1. **`[HttpGet]` (Read)**
   - **Semantic**: Retrieve data. Should never modify the database.
   - **Idempotent**: Calling it once has the same effect as calling it 100 times.
2. **`[HttpPost]` (Create)**
   - **Semantic**: Create a new resource. The server determines the ID.
   - **Not Idempotent**: Calling it 100 times creates 100 new resources.
3. **`[HttpPut]` (Update/Replace)**
   - **Semantic**: Replace an entire resource with a new representation.
   - **Idempotent**: Calling it 100 times leaves the resource in the exact same state as calling it once.
4. **`[HttpDelete]` (Delete)**
   - **Semantic**: Remove a resource.
   - **Idempotent**: Deleting it 100 times still leaves it deleted.

### Specialized Verbs
5. **`[HttpPatch]` (Partial Update)**
   - **Semantic**: Update only specific fields of a resource (e.g., changing just an email address) instead of sending the whole object like PUT.
6. **`[HttpHead]`**
   - **Semantic**: Same as GET, but returns *only* the headers (no body). Useful for checking if a file exists or its size before downloading.
7. **`[HttpOptions]`**
   - **Semantic**: Returns the HTTP methods the server supports for a specific URL. Heavily used in CORS preflight requests.

---

## 2. Making HTTP Requests in C# (Client-Side)

When you need your C# application (or ASP.NET backend) to call a third-party API, you use `HttpClient`.

### ❌ The Wrong Way: `new HttpClient()`
Never instantiate `HttpClient` manually inside a method using `using`. 
```csharp
// BAD: This can cause "Socket Exhaustion" under heavy load.
using (var client = new HttpClient()) 
{
    var result = await client.GetAsync("https://api.example.com");
}
```

### ✅ The Right Way: `IHttpClientFactory`
In modern ASP.NET Core, always inject `IHttpClientFactory` to manage the lifecycle of your connections safely.

**1. Register in `Program.cs`:**
```csharp
builder.Services.AddHttpClient();
```

**2. Inject and Use in a Service:**
```csharp
public class WeatherService
{
    private readonly IHttpClientFactory _httpClientFactory;

    public WeatherService(IHttpClientFactory httpClientFactory)
    {
        _httpClientFactory = httpClientFactory;
    }

    public async Task<string> GetWeatherAsync()
    {
        // Creates a client safely managed by the factory pool
        var client = _httpClientFactory.CreateClient(); 
        
        // GET Request
        var response = await client.GetAsync("https://api.weather.com/today");
        
        response.EnsureSuccessStatusCode(); // Throws if not 2xx
        return await response.Content.ReadAsStringAsync();
    }
}
```

---

## 3. Advanced HttpClient (Typed Clients)

For cleaner code, you can register a "Typed Client." This allows you to pre-configure a specific `HttpClient` for a specific service.

**1. Register the Typed Client:**
```csharp
builder.Services.AddHttpClient<GithubClient>(client => 
{
    client.BaseAddress = new Uri("https://api.github.com/");
    client.DefaultRequestHeaders.Add("Accept", "application/vnd.github.v3+json");
    client.DefaultRequestHeaders.Add("User-Agent", "MyDotNetApp");
});
```

**2. The Client Class:**
```csharp
public class GithubClient
{
    private readonly HttpClient _client;

    // The factory injects the PRE-CONFIGURED HttpClient here
    public GithubClient(HttpClient client) 
    {
        _client = client;
    }

    public async Task<UserDto> GetUserAsync(string username)
    {
        // No need to set headers or base URL here!
        return await _client.GetFromJsonAsync<UserDto>($"users/{username}");
    }
}
```

---

## 🚀 Pro Tip
When consuming JSON APIs, use the modern `GetFromJsonAsync<T>`, `PostAsJsonAsync`, and `PutAsJsonAsync` extension methods provided by `System.Net.Http.Json`. They automatically handle serialization and deserialization using the highly performant `System.Text.Json` library, saving you writing boilerplate parsing code.
