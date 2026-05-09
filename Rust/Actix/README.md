# Actix

## Description
Actix is a powerful, pragmatic, and extremely fast web framework for Rust. It provides type safety, speed, and concurrency thanks to the Rust programming language, making it one of the fastest web frameworks available across all languages.

## How it works
Actix-Web is built on top of the Actix actor framework (though recent versions decoupled heavily from it). It uses Rust's `async/await` and the Tokio runtime to handle highly concurrent requests on multiple threads without blocking, leveraging Rust's ownership model to guarantee memory safety without garbage collection.

## How to code it
Here is a basic example of an Actix server:

```rust
use actix_web::{get, App, HttpResponse, HttpServer, Responder};

#[get("/")]
async fn hello() -> impl Responder {
    HttpResponse::Ok().body("Hello world from Actix!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new().service(hello)
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
```

## Features it supports
- Multi-plexing and WebSockets support
- HTTP/1.x and HTTP/2.0 support
- Streaming and pipelining
- Robust middleware ecosystem
- Extremely high throughput and low latency

## Real projects about it
- **1Password**: Uses Rust and Actix for backend syncing engines.
- **Discord**: Migrated several high-throughput services to Rust/Actix.
- **Kroger**: Uses Actix for their high-performance inventory services.
