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

After installing the tool and adding the design package, run the migration command again:
`dotnet ef migrations add init`

## Other
- `dotnet --version` - Show dotnet version
- `dotnet --info` - Show SDK information
- `dotnet tool install -g <tool>` - Install global tool
