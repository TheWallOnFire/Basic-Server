using Microsoft.Extensions.DependencyInjection;

namespace ASP.NET.Examples;

public interface IMyService { string GetData(); }
public class MyService : IMyService { public string GetData() => "Data from service"; }

public class DIExamples
{
    public void ConfigureServices(IServiceCollection services)
    {
        // 1. Transient: Created every time
        services.AddTransient<IMyService, MyService>();

        // 2. Scoped: Created once per request
        services.AddScoped<IMyService, MyService>();

        // 3. Singleton: Created once for app lifetime
        services.AddSingleton<IMyService, MyService>();
    }
}

public class MyController : ControllerBase
{
    private readonly IMyService _service;

    // Constructor Injection (Best Practice)
    public MyController(IMyService service)
    {
        _service = service;
    }
}
