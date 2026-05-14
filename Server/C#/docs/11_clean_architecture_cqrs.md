# 11. Clean Architecture & CQRS

As applications grow, organizing code into a scalable and maintainable structure becomes critical.

## 1. Clean Architecture (Onion Architecture)
The goal is to decouple the business logic from external concerns (DB, UI, Framework).
- **Core (Domain)**: Entities, Value Objects, Domain Logic. No dependencies.
- **Application**: Use Cases, Interfaces (Abstractions), CQRS Handlers.
- **Infrastructure**: DB implementation (EF Core), External APIs, File System.
- **Presentation**: Web API, Controllers, Razor Pages.

## 2. CQRS (Command Query Responsibility Segregation)
Separates read operations (Queries) from write operations (Commands).
- **Commands**: Change state (`CreateUser`, `UpdateOrder`).
- **Queries**: Read state (`GetUserById`, `GetRecentSales`).
- **MediatR**: A popular library for implementing CQRS in .NET by using a "Mediator" pattern.

## 3. Benefits
- **Testability**: Logic is in the Application layer, easy to test without a DB.
- **Flexibility**: You can swap out the database or the UI without touching the core logic.
- **Scaling**: You can scale Read and Write operations differently.

## 4. Repository & Unit of Work
While EF Core is already a repository/UoW, many developers add another abstraction layer to further decouple from the ORM.
- **Repository**: Encapsulates data access logic.
- **Unit of Work**: Ensures multiple repositories share the same database transaction.
