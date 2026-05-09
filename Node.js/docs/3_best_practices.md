# Node.js Best Practices

## 1. Project Structure
Organize code by feature, not by type:
```
src/
├── users/
│   ├── user.controller.js
│   ├── user.service.js
│   ├── user.model.js
│   └── user.routes.js
├── orders/
│   ├── order.controller.js
│   └── ...
├── middleware/
├── config/
└── app.js
```

## 2. Environment Variables
- Never hardcode secrets. Use `.env` files with `dotenv` for local development.
- Use `process.env.VARIABLE_NAME` to access configuration.
- Validate all required environment variables at startup.

## 3. Error Handling
- Always use `try/catch` with `async/await`.
- Create a centralized error-handling middleware.
- Distinguish between operational errors (e.g., invalid user input) and programmer errors (e.g., `TypeError`).
- Never swallow errors silently.

## 4. Security
- Use `helmet` to set security-related HTTP headers.
- Use `cors` to configure cross-origin resource sharing.
- Sanitize user input to prevent NoSQL injection and XSS.
- Rate-limit APIs with `express-rate-limit`.
- Always use parameterized queries for database operations.

## 5. Logging
- Use a structured logger like `winston` or `pino` instead of `console.log`.
- Log request ID, timestamps, and severity levels.
- Never log sensitive information (passwords, tokens, PII).

## 6. Testing
- **Unit Tests**: Test individual functions/modules in isolation (`Jest`, `Mocha`).
- **Integration Tests**: Test API endpoints with a real or test database (`Supertest`).
- **E2E Tests**: Test complete user flows (`Playwright`, `Cypress`).

## 7. Performance
- Use `compression` middleware for gzip responses.
- Implement caching (Redis) for frequently accessed data.
- Use connection pooling for database connections.
- Avoid synchronous functions in production (`fs.readFileSync`).
