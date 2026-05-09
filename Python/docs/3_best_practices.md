# Python Best Practices for Web Development

## 1. Project Structure
```
project/
├── app/
│   ├── __init__.py
│   ├── main.py
│   ├── models/
│   ├── routes/
│   ├── services/
│   └── schemas/
├── tests/
├── requirements.txt
├── .env
└── README.md
```

## 2. Dependency Management
- Use `requirements.txt` or `Pipfile` to pin dependencies.
- Use `pip freeze > requirements.txt` to export.
- For modern projects, consider `poetry` or `uv` for better dependency resolution.

## 3. Configuration
- Use `.env` files and `python-dotenv` or `pydantic-settings`.
- Never commit secrets to version control.
- Use `process.env.VARIABLE_NAME` patterns via `os.environ.get()`.

## 4. Error Handling
- Use custom exception classes.
- Create centralized error handlers in your framework.
- Return consistent error response formats (JSON with `status`, `message`, `detail`).

## 5. Security
- Always validate and sanitize user input.
- Use parameterized queries (ORMs handle this).
- Implement rate limiting.
- Use HTTPS in production.
- Hash passwords with `bcrypt` or `argon2`.

## 6. Testing
- **pytest**: The de facto testing framework for Python.
- Use `pytest-asyncio` for async code.
- Use `httpx` or `TestClient` for API integration testing.
- Aim for 80%+ code coverage.

## 7. Linting & Formatting
- **Ruff**: Modern, extremely fast linter and formatter (replaces flake8, isort, black).
- **mypy**: Static type checker to catch type errors before runtime.
