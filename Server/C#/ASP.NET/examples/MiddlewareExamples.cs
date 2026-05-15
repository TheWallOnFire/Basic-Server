using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using System.Threading.Tasks;

namespace ASP.NET.Examples;

public class MyCustomMiddleware
{
    private readonly RequestDelegate _next;

    public MyCustomMiddleware(RequestDelegate next)
    {
        _next = next;
    }

    public async Task InvokeAsync(HttpContext context)
    {
        // 1. Logic before the next middleware
        context.Response.Headers.Add("X-Custom-Header", "MyValue");

        // 2. Call the next middleware in the pipeline
        await _next(context);

        // 3. Logic after the next middleware
    }
}

// Extension method to make registration cleaner
public static class MiddlewareExtensions
{
    public static IApplicationBuilder UseMyCustomMiddleware(this IApplicationBuilder builder)
    {
        return builder.UseMiddleware<MyCustomMiddleware>();
    }
}
