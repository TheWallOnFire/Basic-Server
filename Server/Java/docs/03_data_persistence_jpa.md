# 03. Data Persistence with JPA & Hibernate

Java uses the Java Persistence API (JPA) as a standard for Object-Relational Mapping (ORM).

## 1. Spring Data JPA
Reduces the boilerplate of data access layers by using repository interfaces.
```java
public interface UserRepository extends JpaRepository<User, Long> {
    List<User> findByEmail(String email); // Automatically implemented!
}
```

## 2. Entity Mapping
Using annotations to link Java objects to Database tables.
- `@Entity`: Marks the class.
- `@Id`, `@GeneratedValue`: Primary keys.
- `@Column`: Customizing field mapping.
- `@OneToMany`, `@ManyToOne`: Handling relationships.

## 3. Hibernate (The Provider)
The underlying engine that translates your Java code into SQL. It handles:
- **Dirty Checking**: Automatically saving changed objects.
- **Lazy Loading**: Only fetching related data when needed.
- **Caching**: L1 and L2 cache for performance.

## 4. Transactions
Spring manages database transactions using the `@Transactional` annotation.
```java
@Transactional
public void purchaseProduct(Long productId) {
    // Both steps succeed or fail together
    updateInventory(productId);
    createOrder(productId);
}
```

## 5. Database Migrations
Always use a tool to manage schema changes over time:
- **Flyway**: Simple, SQL-based migrations.
- **Liquibase**: More complex, XML/YAML/JSON-based migrations.
