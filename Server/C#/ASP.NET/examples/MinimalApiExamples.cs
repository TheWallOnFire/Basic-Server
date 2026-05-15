using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// 1. Basic GET
app.MapGet("/", () => "Hello World!");

// 2. Route Parameters
app.MapGet("/users/{id}", (int id) => $"User {id}");

// 3. Post with Body (Automatic DTO binding)
app.MapPost("/data", (MyRequest request) => Results.Accepted($"/data/{request.Id}", request));

// 4. Grouping
var users = app.MapGroup("/api/users");
users.MapGet("/", () => "List users");
users.MapGet("/{id}", (int id) => $"Get user {id}");

app.Run();

public record MyRequest(int Id, string Name);
