using Microsoft.EntityFrameworkCore;
using System.Linq;
using System.Threading.Tasks;

namespace ASP.NET.Examples;

public class User { public int Id { get; set; } public string Name { get; set; } }

public class MyDbContext : DbContext
{
    public DbSet<User> Users { get; set; }
    public MyDbContext(DbContextOptions<MyDbContext> options) : base(options) { }
}

public class EFCoreExamples
{
    private readonly MyDbContext _context;
    public EFCoreExamples(MyDbContext context) => _context = context;

    public async Task QueryExamples()
    {
        // 1. Basic Query
        var users = await _context.Users.ToListAsync();

        // 2. Filter and Sort
        var filtered = await _context.Users
            .Where(u => u.Name.StartsWith("A"))
            .OrderBy(u => u.Name)
            .ToListAsync();

        // 3. Performance: Read-only (No Tracking)
        var fast = await _context.Users.AsNoTracking().FirstOrDefaultAsync();
    }
}
