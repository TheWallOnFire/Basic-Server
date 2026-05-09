# GORM

## Description
GORM is the most popular ORM library for Go (Golang). It is a full-featured ORM with associations, hooks, preloading, transactions, auto-migrations, and a developer-friendly API.

## How it works
GORM uses Go structs as models and maps them to database tables via struct tags. It provides a chainable API that feels natural in Go while handling SQL generation, connection management, and query execution behind the scenes.

## How to code it

### Define Models
```go
type User struct {
    gorm.Model                    // Embeds ID, CreatedAt, UpdatedAt, DeletedAt
    Name  string `gorm:"not null"`
    Email string `gorm:"uniqueIndex"`
    Posts []Post
}

type Post struct {
    gorm.Model
    Title    string
    Content  string
    UserID   uint
}
```

### CRUD Operations
```go
import "gorm.io/gorm"
import "gorm.io/driver/postgres"

dsn := "host=localhost user=admin password=secret dbname=mydb port=5432"
db, _ := gorm.Open(postgres.Open(dsn), &gorm.Config{})

// Auto migrate
db.AutoMigrate(&User{}, &Post{})

// Create
db.Create(&User{Name: "Alice", Email: "alice@example.com"})

// Read
var user User
db.First(&user, 1)                          // by primary key
db.Where("email = ?", "alice@example.com").First(&user)

// Read with preloading
db.Preload("Posts").Find(&user)

// Update
db.Model(&user).Update("Name", "Bob")

// Delete (soft delete by default)
db.Delete(&user, 1)
```

## Features it supports
- Auto migrations
- Associations (Has One, Has Many, Belongs To, Many To Many)
- Hooks (Before/After Create, Update, Delete)
- Soft deletes (built-in via `gorm.Model`)
- Eager loading with `Preload`
- Raw SQL and named arguments

## Supported Databases
PostgreSQL, MySQL, SQLite, SQL Server
