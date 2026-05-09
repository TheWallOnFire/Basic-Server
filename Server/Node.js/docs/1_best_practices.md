# Node.js Best Practices

## 1. Project Structure
Use a modular structure:
- `src/controllers`: Request handlers.
- `src/services`: Business logic.
- `src/models`: Database schemas.
- `src/middlewares`: Auth, error handling, etc.

## 2. Error Handling
- **Avoid `try-catch` hell**: Use a global error handling middleware.
- **Async/Await**: Use it instead of callbacks to avoid "callback hell".
- **Custom Errors**: Create your own error classes for different HTTP statuses.

## 3. Performance
- **Avoid blocking the Event Loop**: Don't perform heavy CPU tasks (image processing, large loops) in the main thread.
- **Use Cluster Module**: Take advantage of multi-core systems by spawning worker processes.
- **Keep it Stateless**: Use Redis for sessions so you can scale horizontally.

## 4. Dependencies
- **Keep it Lean**: Don't install massive libraries for small tasks (e.g., use `date-fns` instead of `moment`).
- **Use `npm audit`**: Regularly check for security vulnerabilities.
