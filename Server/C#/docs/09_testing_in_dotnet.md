# 09. Testing in .NET

Writing automated tests is essential for building reliable and maintainable .NET applications.

## 1. Test Frameworks
- **xUnit**: The most popular, modern, and extensible framework.
- **NUnit**: Feature-rich and widely used in legacy and enterprise projects.
- **MSTest**: The official Microsoft test framework.

## 2. Mocking & Isolation
- **Moq**: The standard library for creating mock objects of interfaces/classes.
  ```csharp
  var mock = new Mock<IUserService>();
  mock.Setup(s => s.GetById(1)).Returns(new User { Name = "John" });
  ```
- **NSubstitute**: A more concise alternative to Moq.

## 3. Assertions
- **FluentAssertions**: Provides a more readable way to assert test results.
  ```csharp
  result.Should().NotBeNull().And.HaveCount(5);
  ```

## 4. Integration Testing
- **WebApplicationFactory**: Allows you to run your full ASP.NET Core app in-memory for integration tests.
- **TestServer**: The component used to host the app during integration tests.
- **SQLite In-Memory**: Useful for testing EF Core without a full SQL Server.

## 5. TDD (Test Driven Development)
The "Red-Green-Refactor" cycle:
1. **Red**: Write a failing test.
2. **Green**: Write just enough code to make the test pass.
3. **Refactor**: Clean up the code while keeping the test green.
