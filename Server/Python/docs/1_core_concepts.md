# Python Web Development Core Concepts

## 1. WSGI vs. ASGI
- **WSGI (Web Server Gateway Interface)**: The traditional synchronous standard for Python web applications. Used by Flask, Django, and Pyramid. Each request is handled sequentially.
- **ASGI (Asynchronous Server Gateway Interface)**: The modern async standard. Used by FastAPI, Starlette, and Django Channels. Supports WebSockets, long polling, and concurrent request handling.

## 2. Virtual Environments
Always isolate project dependencies using virtual environments:
```bash
# Create
python -m venv venv

# Activate (Windows)
venv\Scripts\activate

# Activate (Linux/Mac)
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt
```

## 3. Decorators
Decorators are heavily used in Python web frameworks for routing:
```python
@app.route('/hello')        # Flask
@app.get('/hello')          # FastAPI
def hello(): ...
```
A decorator is simply a function that wraps another function, adding behavior before or after it executes.

## 4. ORM (Object-Relational Mapping)
Instead of writing raw SQL, Python frameworks use ORMs to interact with databases using Python objects:
- **SQLAlchemy**: The most popular standalone ORM, used with Flask and FastAPI.
- **Django ORM**: Built into Django.
- **Tortoise ORM**: Async ORM for FastAPI and Starlette.

## 5. Type Hints
Modern Python (3.5+) supports type annotations. FastAPI relies heavily on them for automatic validation:
```python
def greet(name: str, age: int = 18) -> str:
    return f"Hello {name}, you are {age}"
```

## 6. Dependency Injection
FastAPI has a built-in DI system. Flask and Django use patterns like Blueprints and middleware to achieve similar goals:
```python
# FastAPI example
async def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

@app.get("/users")
async def read_users(db: Session = Depends(get_db)):
    return db.query(User).all()
```
