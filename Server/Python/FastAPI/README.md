# FastAPI

## Description
FastAPI is a modern, fast (high-performance), web framework for building APIs with Python 3.8+ based on standard Python type hints. It is designed to be easy to use, highly productive, and incredibly fast.

## How it works
FastAPI is built on top of Starlette for the web parts and Pydantic for the data parts. It leverages standard Python type hints to automatically validate data, serialize requests/responses, and generate OpenAPI (Swagger) documentation. It runs on an ASGI server (like Uvicorn) allowing for fully asynchronous code.

## How to code it
Here is a basic example of a FastAPI server:

```python
from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World from FastAPI"}

@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "q": q}

# Run with: uvicorn main:app --reload
```

## Features it supports
- Very high performance, on par with NodeJS and Go
- Automatic interactive API documentation (Swagger UI and ReDoc)
- Data validation and serialization via Pydantic
- 100% type-annotated and asynchronous support
- Dependency injection system
- Editor support and autocompletion everywhere

## Real projects about it
- **Netflix**: Uses FastAPI for internal crisis management orchestration.
- **Uber**: Uses FastAPI for some of their machine learning endpoints.
- **Microsoft**: Uses FastAPI in various cloud services.
