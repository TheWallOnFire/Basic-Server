# 04. Web API & REST with Spring MVC

Spring MVC is the framework used to build RESTful web services in Spring Boot.

## 1. Controllers
The entry point for HTTP requests.
```java
@RestController
@RequestMapping("/api/users")
public class UserController {
    
    @GetMapping("/{id}")
    public ResponseEntity<User> getUser(@PathVariable Long id) {
        return ResponseEntity.ok(userService.findById(id));
    }
}
```

## 2. Request Handling
- **@PathVariable**: URL parts (e.g., `/users/1`).
- **@RequestParam**: Query strings (e.g., `/users?name=John`).
- **@RequestBody**: JSON payload in POST/PUT.
- **@RequestHeader**: Accessing HTTP headers.

## 3. Response Entities
Use `ResponseEntity<T>` to control the HTTP status code and headers precisely.

## 4. Exception Handling
Centralized error handling using `@ControllerAdvice`.
```java
@ControllerAdvice
public class GlobalExceptionHandler {
    @ExceptionHandler(UserNotFoundException.class)
    public ResponseEntity<String> handleNotFound(UserNotFoundException ex) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(ex.getMessage());
    }
}
```

## 5. Validation
Use Hibernate Validator (JSR 380) to validate input automatically.
- `@NotNull`, `@Size`, `@Email`, `@Min`/`@Max`.
- Triggered by adding `@Valid` to the controller method parameter.
