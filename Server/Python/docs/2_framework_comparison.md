# Python Web Frameworks Comparison

## Quick Comparison Table

| Feature | Flask | FastAPI | Django | Pyramid | Tornado |
| :--- | :--- | :--- | :--- | :--- | :--- |
| **Type** | Micro | Micro (Async) | Full-Stack | Flexible | Async |
| **Speed** | Moderate | Very Fast | Moderate | Moderate | Fast |
| **Learning Curve** | Low | Low-Medium | Medium-High | Medium | Medium |
| **Async** | No (needs extensions) | Yes (native) | Partial (Channels) | No | Yes (native) |
| **ORM** | SQLAlchemy (external) | SQLAlchemy (external) | Built-in | SQLAlchemy (external) | External |
| **Admin Panel** | No | No | Yes (built-in) | No | No |
| **Auto API Docs** | No | Yes (Swagger/ReDoc) | No | No | No |
| **Best For** | Simple APIs, Prototyping | Modern APIs, ML serving | Full web apps, CMS | Flexible architectures | WebSockets, Real-time |

## When to Use What

- **Flask**: You want maximum simplicity and control. Great for beginners and small to medium APIs.
- **FastAPI**: You need high performance, automatic docs, and type safety. Best for modern REST/GraphQL APIs and ML model serving.
- **Django**: You need a full-stack solution with admin panel, authentication, and ORM out of the box. Best for content-heavy web apps.
- **Pyramid**: You want a framework that starts small but can scale to enterprise without switching. Best for large, modular applications.
- **Tornado**: You need native WebSocket support and async I/O without ASGI. Best for real-time applications and long-lived connections.
