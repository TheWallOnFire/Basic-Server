# Rocket

## Description
Rocket is a web framework for Rust that makes it simple to write fast, secure web applications without sacrificing flexibility, usability, or type safety. It focuses heavily on developer ergonomics.

## How it works
Rocket uses Rust's powerful macro system to automatically route requests, parse parameters, and validate data. When an HTTP request comes in, Rocket checks it against defined routes and their type signatures. If a request doesn't match the required types, Rocket automatically handles the error, ensuring your handlers only execute with valid data.

## How to code it
Here is a basic example of a Rocket server:

```rust
#[macro_use] extern crate rocket;

#[get("/")]
fn index() -> &'static str {
    "Hello, world from Rocket!"
}

#[launch]
fn rocket() -> _ {
    rocket::build().mount("/", routes![index])
}
```

## Features it supports
- Boilerplate-free API via macros
- Type-safe routing and parameter extraction
- Built-in templating support
- Automatic form parsing and JSON serialization
- Extensible via Fairings (Rocket's middleware equivalent)

## Real projects about it
- **Bitwarden**: The open-source community server (bitwarden_rs, now Vaultwarden) is built entirely with Rocket.
- **Rust crates.io**: Uses Rocket concepts in parts of its ecosystem.
