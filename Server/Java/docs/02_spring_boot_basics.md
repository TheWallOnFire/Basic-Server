# 02. Spring Boot Basics

Spring Boot is an "opinionated" framework that makes it easy to create stand-alone, production-grade Spring-based applications.

## 1. Core Concepts
- **Inversion of Control (IoC)**: The framework manages object lifecycles.
- **Dependency Injection (DI)**: Passing dependencies into objects (usually via constructors).
- **Beans**: Objects managed by the Spring IoC container.

## 2. Spring Boot "Magic"
- **Starters**: Curated sets of dependencies (e.g., `spring-boot-starter-web`).
- **Autoconfiguration**: Spring Boot automatically configures beans based on the libraries in your classpath.
- **Embedded Server**: Includes Tomcat or Jetty by default—no need to deploy WAR files.

## 3. Key Annotations
- `@SpringBootApplication`: The main entry point.
- `@Component`, `@Service`, `@Repository`: Mark classes for scanning.
- `@Configuration`: Define beans manually in a class.
- `@Value`: Inject properties from `application.properties`.

## 4. Bean Lifecycle & Scopes
- **Singleton (Default)**: One instance per IoC container.
- **Prototype**: A new instance every time it's requested.
- **Request/Session**: Web-aware scopes.

## 5. Configuration (Externalized)
Settings are usually kept in `src/main/resources/application.properties` or `application.yml`.
```yaml
server:
  port: 8080
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/mydb
```
