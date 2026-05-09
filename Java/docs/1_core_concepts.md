# Java Core Concepts for Web Development

## 1. JVM (Java Virtual Machine)
Java code compiles to bytecode that runs on the JVM, making it platform-independent ("write once, run anywhere"). The JVM handles memory management via Garbage Collection (GC).

## 2. Dependency Injection (DI)
The cornerstone of Spring and most Java frameworks. Instead of objects creating their own dependencies, the framework injects them:
```java
@Service
public class UserService {
    private final UserRepository repo;
    
    @Autowired
    public UserService(UserRepository repo) {
        this.repo = repo;
    }
}
```

## 3. Annotations
Java relies heavily on annotations to reduce boilerplate:
- `@RestController` — Marks a class as a REST API controller.
- `@GetMapping("/path")` — Maps HTTP GET to a method.
- `@Entity` — Marks a class as a JPA database entity.
- `@Autowired` — Injects a dependency automatically.

## 4. Build Tools
- **Maven**: Uses `pom.xml` for dependency management. Convention-based.
- **Gradle**: Uses `build.gradle` (Groovy/Kotlin DSL). More flexible and faster.

## 5. JPA (Java Persistence API)
The standard specification for ORM in Java. Hibernate is the most popular implementation:
```java
@Entity
public class User {
    @Id @GeneratedValue
    private Long id;
    private String name;
    private String email;
}
```

## 6. Reactive Programming
Modern Java frameworks support reactive streams for non-blocking I/O:
- **Spring WebFlux**: Reactive alternative to Spring MVC.
- **Quarkus Reactive**: Uses Mutiny for reactive programming.
- **Micronaut**: Built on Netty for reactive HTTP.
