# Poetry & Pipenv

## Description
These are modern dependency management and packaging tools for Python that solve the "dependency hell" and provide deterministic builds.

## Poetry
Poetry handles dependency management, virtual environments, and packaging/publishing in a single tool.
```bash
# Start a new project
poetry new my-app

# Add a dependency
poetry add fastapi

# Run a command in the virtual environment
poetry run python main.py

# Build and publish to PyPI
poetry build
poetry publish
```

## Pipenv
Pipenv is the "official" tool recommended for managing dependencies and virtual environments. It combines `pip` and `virtualenv`.
```bash
# Install dependencies and create virtualenv
pipenv install fastapi

# Activate the virtualenv
pipenv shell

# Check for security vulnerabilities
pipenv check
```

## Comparison

| Feature | pip | Pipenv | Poetry |
| :--- | :--- | :--- | :--- |
| **Lock File** | ❌ No | ✅ Pipfile.lock | ✅ poetry.lock |
| **Dependency Resolution** | Basic | Advanced | Best in class |
| **Packaging** | ❌ No | ❌ No | ✅ Yes (build/publish) |
| **Ease of Use** | High | Medium | High |
| **Standard** | Legacy | Recommended | Modern Favorite |
