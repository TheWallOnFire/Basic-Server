using Microsoft.AspNetCore.Mvc;

namespace ASP.NET.Examples;

[ApiController]
[Route("api/[controller]")]
public class RoutingExamples : ControllerBase
{
    // GET: api/routing/basic
    [HttpGet("basic")]
    public IActionResult GetBasic() => Ok("Basic Routing");

    // GET: api/routing/parameters/42
    [HttpGet("parameters/{id:int}")]
    public IActionResult GetWithParams(int id) => Ok($"Received ID: {id}");

    // GET: api/routing/query?name=test
    [HttpGet("query")]
    public IActionResult GetWithQuery([FromQuery] string name) => Ok($"Hello {name}");

    // POST: api/routing/body
    [HttpPost("body")]
    public IActionResult PostWithBody([FromBody] MyData data) => CreatedAtAction(nameof(GetBasic), data);
}

public record MyData(string Name, int Value);
