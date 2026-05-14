# 01. Java Foundations

Mastering the language core is essential before moving to frameworks like Spring Boot.

## 1. Object-Oriented Programming (OOP)
Java is strictly object-oriented:
- **Inheritance**: `extends` keyword.
- **Interfaces**: `implements` (defining contracts).
- **Polymorphism**: Method overriding and overloading.
- **Encapsulation**: Access modifiers (`public`, `private`, `protected`).

## 2. Collections Framework
Essential for managing groups of objects:
- **List**: `ArrayList`, `LinkedList`.
- **Set**: `HashSet`, `TreeSet` (No duplicates).
- **Map**: `HashMap`, `TreeMap` (Key-Value pairs).

## 3. Lambdas & Streams (Java 8+)
Functional programming features that reduced boilerplate significantly.
```java
List<String> names = Arrays.asList("Alice", "Bob", "Charlie");

// Stream API
List<String> filtered = names.stream()
    .filter(name -> name.startsWith("A"))
    .map(String::toUpperCase)
    .collect(Collectors.toList());
```

## 4. Modern Java Features (11-21)
- **Var**: Local variable type inference (`var list = new ArrayList<String>();`).
- **Records (Java 14+)**: Concise classes for data-only objects.
  ```java
  public record User(Long id, String name) {}
  ```
- **Text Blocks**: Multi-line strings using `"""`.
- **Pattern Matching**: Simplified `instanceof` checks.

## 5. Exception Handling
- **Checked Exceptions**: Must be handled or declared (`IOException`).
- **Unchecked Exceptions**: Runtime exceptions (`NullPointerException`).
- **Try-with-resources**: Automatic closing of resources like file streams.
