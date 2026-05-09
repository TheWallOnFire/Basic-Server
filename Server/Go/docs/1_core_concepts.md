# Go Core Concepts for Web Development

## 1. Goroutines and Concurrency
Go's killer feature is built-in concurrency via goroutines — lightweight threads managed by the Go runtime:
```go
go func() {
    fmt.Println("Running concurrently!")
}()
```
Unlike OS threads (which use ~1MB of stack), goroutines start with ~2KB and grow dynamically.

## 2. Channels
Goroutines communicate safely through channels, avoiding shared memory race conditions:
```go
ch := make(chan string)
go func() { ch <- "hello" }()
msg := <-ch  // blocks until a value is received
```

## 3. Interfaces
Go uses implicit interface satisfaction — no `implements` keyword. If a type has the right methods, it satisfies the interface:
```go
type Handler interface {
    ServeHTTP(w http.ResponseWriter, r *http.Request)
}
```

## 4. The `net/http` Standard Library
Go has a powerful built-in HTTP server. Frameworks like Gin and Echo are wrappers around it:
```go
http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello, World!")
})
http.ListenAndServe(":8080", nil)
```

## 5. Error Handling
Go does not have exceptions. Errors are returned as values and must be checked explicitly:
```go
result, err := doSomething()
if err != nil {
    log.Fatal(err)
}
```

## 6. Struct Tags
Used heavily for JSON serialization and ORM mapping:
```go
type User struct {
    Name  string `json:"name" db:"user_name"`
    Email string `json:"email" db:"user_email"`
}
```
