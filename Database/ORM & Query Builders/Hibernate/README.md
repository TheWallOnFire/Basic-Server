# Hibernate

## Description
Hibernate is the most widely used ORM framework in the Java ecosystem. It is the reference implementation of the Java Persistence API (JPA) specification and is used by millions of enterprise Java applications worldwide.

## How it works
Hibernate maps Java classes (entities) to database tables using annotations or XML. It manages the full lifecycle of persistent objects — loading, saving, updating, and deleting — and generates optimized SQL under the hood. It includes a first-level and second-level caching mechanism to reduce database round-trips.

## How to code it

### Define an Entity
```java
import jakarta.persistence.*;

@Entity
@Table(name = "users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(unique = true)
    private String email;

    @OneToMany(mappedBy = "author", cascade = CascadeType.ALL)
    private List<Post> posts;

    // getters and setters
}
```

### CRUD Operations
```java
SessionFactory factory = new Configuration().configure().buildSessionFactory();
Session session = factory.openSession();

// Create
session.beginTransaction();
User user = new User();
user.setName("Alice");
user.setEmail("alice@example.com");
session.persist(user);
session.getTransaction().commit();

// Read
User found = session.get(User.class, 1L);
List<User> all = session.createQuery("FROM User", User.class).list();

// HQL (Hibernate Query Language)
List<User> filtered = session.createQuery(
    "FROM User u WHERE u.name LIKE :name", User.class)
    .setParameter("name", "Ali%")
    .list();
```

## Features it supports
- JPA standard compliance
- HQL (Hibernate Query Language) and Criteria API
- First-level (session) and second-level (shared) caching
- Lazy and eager loading strategies
- Automatic schema generation and validation
- Batch processing for bulk operations

## Supported Databases
PostgreSQL, MySQL, MariaDB, Oracle, DB2, SQL Server, H2, HSQLDB
