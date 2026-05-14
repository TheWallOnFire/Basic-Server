# 03. Testing Foundations

Automated testing is the key to delivering stable, maintainable, and bug-free software. In the .NET world, testing is a first-class citizen.

---

## 1. The Testing Pyramid
A healthy project usually follows the "Testing Pyramid" strategy:
1. **Unit Tests (Base)**: Test individual methods/classes in total isolation. Fast and cheap.
2. **Integration Tests (Middle)**: Test how multiple components (e.g., Service + Database) work together.
3. **E2E / UI Tests (Top)**: Test the full system from the user's perspective. Slow and expensive.

---

## 2. Unit Testing with xUnit
xUnit is the industry standard for modern .NET testing.

### [Fact] vs [Theory]
- **`[Fact]`**: A test that is always true. It takes no parameters.
- **`[Theory]`**: A test that is true for a specific set of data. It uses `[InlineData]` to pass multiple inputs.

```csharp
[Theory]
[InlineData(1, 2, 3)]
[InlineData(-1, 1, 0)]
public void Add_ShouldReturnSum(int a, int b, int expected)
{
    // Arrange
    var calculator = new Calculator();
    
    // Act
    var result = calculator.Add(a, b);
    
    // Assert
    Assert.Equal(expected, result);
}
```

---

## 3. The AAA Pattern
Every good test follows the **Arrange, Act, Assert** pattern:
1. **Arrange**: Set up the object and the environment (Mocks, Data).
2. **Act**: Execute the method being tested.
3. **Assert**: Verify that the result matches your expectations.

---

## 4. Mocking with Moq
When testing a service, you want to avoid calling the real database or an external API. **Mocking** allows you to create a "fake" version of an interface.

```csharp
// Arrange
var mockRepo = new Mock<IUserRepository>();
mockRepo.Setup(repo => repo.GetById(1))
        .Returns(new User { Id = 1, Name = "John" });

var service = new UserService(mockRepo.Object);

// Act
var user = service.GetUser(1);

// Assert
Assert.NotNull(user);
mockRepo.Verify(r => r.GetById(1), Times.Once); // Verify it was called!
```

---

## 5. Fluent Assertions
Makes your test expectations read like a sentence.
- **Instead of**: `Assert.Equal(5, list.Count);`
- **Use**: `list.Should().HaveCount(5).And.Contain(x => x.Id == 1);`

---

## 6. Integration Testing
In ASP.NET Core, we use **WebApplicationFactory** to spin up the entire application in memory. This allows you to test your Controllers, Middleware, and Database integration without actually deploying the app.

- **In-Memory Database**: Use **SQLite In-Memory** or the **EF Core In-Memory Provider** to keep integration tests fast and isolated.

---

## 7. TDD (Test-Driven Development)
The practice of writing a test **before** writing the code.
1. **🔴 RED**: Write a failing test for a new feature.
2. **🟢 GREEN**: Write the simplest code possible to make the test pass.
3. **🔵 REFACTOR**: Clean up the code while keeping the test passing.

---

## 🚀 Why This Matters
Testing is not about "finding bugs"—it's about **enabling change**. With a solid test suite, you can refactor your entire codebase or upgrade dependencies with total confidence that you haven't broken existing features.
