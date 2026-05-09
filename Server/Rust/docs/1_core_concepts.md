# Rust Core Concepts for Web Development

## 1. Ownership and Borrowing
Rust's defining feature. The compiler enforces memory safety at compile time without a garbage collector:
- **Ownership**: Each value has exactly one owner. When the owner goes out of scope, the value is dropped.
- **Borrowing**: You can reference a value without taking ownership. Immutable borrows (`&T`) are unlimited; mutable borrows (`&mut T`) are exclusive.
- **Lifetimes**: The compiler tracks how long references are valid to prevent dangling pointers.

## 2. `async/await`
Rust's async model is zero-cost. Async functions return `Future`s that are polled by a runtime (like Tokio):
```rust
async fn fetch_data() -> Result<String, Error> {
    let response = reqwest::get("https://api.example.com").await?;
    let body = response.text().await?;
    Ok(body)
}
```

## 3. Error Handling with `Result<T, E>`
Rust uses the `Result` type instead of exceptions. The `?` operator propagates errors cleanly:
```rust
fn read_file(path: &str) -> Result<String, std::io::Error> {
    let content = std::fs::read_to_string(path)?;
    Ok(content)
}
```

## 4. Traits
Similar to interfaces in other languages, traits define shared behavior:
```rust
trait Greet {
    fn hello(&self) -> String;
}
```

## 5. Cargo (Package Manager)
- `cargo new myproject` — Create a new project.
- `cargo build` — Compile the project.
- `cargo run` — Compile and run.
- `cargo test` — Run tests.
- `Cargo.toml` — The manifest file listing dependencies.

## 6. Why Rust for Web?
- **Memory Safety**: No segfaults, no data races, guaranteed at compile time.
- **Performance**: Comparable to C/C++ with zero-cost abstractions.
- **Concurrency**: The ownership model makes concurrent code safe by default.
