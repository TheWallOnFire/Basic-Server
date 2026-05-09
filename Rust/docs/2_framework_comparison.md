# Rust Web Frameworks Comparison

## Comparison Table

| Feature | Actix Web | Rocket | Warp |
| :--- | :--- | :--- | :--- |
| **Philosophy** | Performance-first | Ergonomics-first | Functional composition |
| **Performance** | Top-tier | Very Good | Top-tier |
| **Learning Curve** | Medium | Low (for Rust) | High |
| **Async Runtime** | Tokio | Tokio (v0.5+) | Tokio |
| **Macro Usage** | Moderate | Heavy | Minimal |
| **Type Safety** | High | Very High | Very High |
| **Best For** | High-throughput APIs | Rapid prototyping | Composable microservices |

## When to Use What

- **Actix Web**: When raw throughput matters most. Great for production-grade, high-concurrency APIs.
- **Rocket**: When developer ergonomics and rapid iteration are priorities. The most "batteries-included" Rust framework.
- **Warp**: When you prefer a functional programming style and want highly composable route definitions via filters.

## Common Rust Web Ecosystem Libraries
- **Tokio**: The most popular async runtime for Rust.
- **Serde**: Serialization/deserialization framework (JSON, YAML, TOML).
- **SQLx**: Async SQL toolkit with compile-time query verification.
- **Diesel**: Type-safe ORM and query builder (synchronous).
- **Tower**: Middleware and service abstractions (used by Axum/Warp).
