# API Design Patterns

## 1. REST (Representational State Transfer)
The most common API architectural style.
- **Principles**: Stateless, Client-Server, Cacheable, Uniform Interface.
- **HTTP Verbs**: GET (Read), POST (Create), PUT/PATCH (Update), DELETE (Delete).
- **Status Codes**: 200 (OK), 201 (Created), 400 (Bad Request), 401 (Unauthorized), 404 (Not Found), 500 (Server Error).

## 2. GraphQL
A query language for APIs that gives clients the power to ask for exactly what they need and nothing more.
- **Pros**: Prevents over-fetching and under-fetching. Great for mobile apps.
- **Cons**: Complex to implement, hard to cache.

## 3. gRPC (Google Remote Procedure Call)
A modern open-source high-performance RPC framework that can run in any environment.
- **Mechanism**: Uses HTTP/2 for transport and Protocol Buffers (Protobuf) for serialization.
- **Pros**: Extremely fast, bi-directional streaming, code generation.
- **Best for**: Internal microservices communication.

## 4. Webhooks
The "Push" model of APIs. Instead of polling for data, the server sends data to the client when an event occurs.
- **Use Case**: Stripe payments, GitHub push events.
