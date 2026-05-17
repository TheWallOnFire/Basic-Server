# DotNet Commands

## Project Management
- `dotnet new` - Create a new project
- `dotnet restore` - Restore project dependencies
- `dotnet build` - Build the project
- `dotnet clean` - Clean build outputs
- `dotnet publish` - Publish the project

## Running & Debugging
- `dotnet run` - Run the project
- `dotnet watch run` - Run with file watching
- `dotnet test` - Run unit tests

## NuGet & Packages
- `dotnet add package <name>` - Add NuGet package
- `dotnet remove package <name>` - Remove package
- `dotnet nuget push` - Push package to NuGet

## Entity Framework
- `dotnet ef migrations add <name>` - Create migration
- `dotnet ef database update` - Apply migrations
- `dotnet ef dbcontext scaffold` - Scaffold from database

### Troubleshooting: "dotnet-ef does not exist" error
If you see "dotnet-ef does not exist" or "specified command or file was not found":

- Install the dotnet-ef global tool:
	- `dotnet tool install --global dotnet-ef`
- Or install as a local tool in the solution (recommended for projects):
	- Create or edit `./.config/dotnet-tools.json` or run `dotnet new tool-manifest` then
	- `dotnet tool install dotnet-ef`
- Ensure your project has the design package (required for migrations):
	- `dotnet add package Microsoft.EntityFrameworkCore.Design`
- If you already installed the tool, try:
	- `dotnet tool update --global dotnet-ef`
	- `dotnet tool restore`
- Verify your environment and SDK:
	- `dotnet --info` - Check for:
		- .NET SDK version and runtime versions
		- OS and architecture compatibility
		- Installed workloads and tools

### Fixing "Unable to resolve service for type 'Microsoft.EntityFrameworkCore.DbContextOptions'"
If you get this error when creating migrations or running `dotnet ef`:

- Ensure your `ApplicationDBContext` constructor accepts the typed options:
	- `public ApplicationDBContext(DbContextOptions<ApplicationDBContext> options) : base(options) { }
- Do not use the non-generic `DbContextOptions` in the constructor.
- If design-time services cannot create the context, add a factory:
	- `public class ApplicationDBContextFactory : IDesignTimeDbContextFactory<ApplicationDBContext>`
	- Implement `CreateDbContext(string[] args)` and return a new context with `DbContextOptionsBuilder<ApplicationDBContext>`.
- Confirm your `Program.cs` or `Startup.cs` registers the context with `AddDbContext<ApplicationDBContext>()`.

After installing the tool and adding the design package, run the migration command again:
`dotnet ef migrations add init`

### Fixing "migration already applied" errors
If you see an error like:
- `The migration '20260517034110_init' has already been applied to the database. Revert it and try again.`

- If the migration was already applied to the current database, revert the database to the previous migration:
    - `dotnet ef database update <previous_migration_name>`
- To revert all applied migrations and return the database to its initial state:
    - `dotnet ef database update 0`
- If the migration was added locally but not applied, remove it from the project:
    - `dotnet ef migrations remove`
- If the migration has already been applied to other databases, create a new migration to revert the schema changes or apply a new migration containing the desired fixes.
- Confirm the migration history table `__EFMigrationsHistory` matches the project migrations before re-running commands.


## Other
- `dotnet --version` - Show dotnet version
- `dotnet --info` - Show SDK information
- `dotnet tool install -g <tool>` - Install global tool
