# SQLAlchemy

## Description
SQLAlchemy is the most popular and powerful SQL toolkit and ORM for Python. It provides a full suite of well-known enterprise-level persistence patterns, designed for efficient and high-performing database access.

## How it works
SQLAlchemy has two main components:
- **Core**: A SQL expression language and schema/types system for constructing raw SQL queries programmatically.
- **ORM**: A high-level object-relational mapper that maps Python classes to database tables.

You can use either layer independently or combine them.

## How to code it

### Define Models (ORM)
```python
from sqlalchemy import create_engine, Column, Integer, String, ForeignKey
from sqlalchemy.orm import declarative_base, relationship, Session

Base = declarative_base()

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    name = Column(String(50), nullable=False)
    email = Column(String(100), unique=True)
    posts = relationship('Post', back_populates='author')

class Post(Base):
    __tablename__ = 'posts'
    id = Column(Integer, primary_key=True)
    title = Column(String(200))
    author_id = Column(Integer, ForeignKey('users.id'))
    author = relationship('User', back_populates='posts')
```

### CRUD Operations
```python
engine = create_engine('postgresql://user:pass@localhost/mydb')
Base.metadata.create_all(engine)

with Session(engine) as session:
    # Create
    user = User(name='Alice', email='alice@example.com')
    session.add(user)
    session.commit()

    # Read
    users = session.query(User).filter_by(name='Alice').all()

    # Update
    user.name = 'Alice Updated'
    session.commit()

    # Delete
    session.delete(user)
    session.commit()
```

## Features it supports
- Both high-level ORM and low-level SQL Core
- Connection pooling built-in
- Migration support via Alembic
- Async support (`asyncio`)
- Works with Flask, FastAPI, Django (via adapters)

## Supported Databases
PostgreSQL, MySQL, MariaDB, SQLite, Oracle, MS SQL Server
