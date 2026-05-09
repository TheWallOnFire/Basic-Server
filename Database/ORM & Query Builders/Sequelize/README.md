# Sequelize

## Description
Sequelize is a mature, promise-based Node.js ORM for PostgreSQL, MySQL, MariaDB, SQLite, and Microsoft SQL Server. It supports solid transaction support, relations, eager and lazy loading, and more.

## How it works
Sequelize uses JavaScript classes (Models) to represent database tables. You define models, their attributes, and relationships in code. Sequelize then translates your method calls into the appropriate SQL for the configured database dialect.

## How to code it

### 1. Setup
```bash
npm install sequelize pg pg-hstore   # For PostgreSQL
```

### 2. Define Models and Connect
```javascript
const { Sequelize, DataTypes } = require('sequelize');

const sequelize = new Sequelize('database', 'username', 'password', {
  host: 'localhost',
  dialect: 'postgres'
});

// Define a model
const User = sequelize.define('User', {
  name: { type: DataTypes.STRING, allowNull: false },
  email: { type: DataTypes.STRING, unique: true, allowNull: false }
});

const Post = sequelize.define('Post', {
  title: { type: DataTypes.STRING, allowNull: false },
  content: { type: DataTypes.TEXT }
});

// Define relationships
User.hasMany(Post);
Post.belongsTo(User);
```

### 3. CRUD Operations
```javascript
// Sync tables
await sequelize.sync({ alter: true });

// Create
const user = await User.create({ name: 'Alice', email: 'alice@example.com' });

// Read with relations
const users = await User.findAll({ include: Post });

// Update
await User.update({ name: 'Bob' }, { where: { id: 1 } });

// Delete
await User.destroy({ where: { id: 1 } });
```

## Features it supports
- Support for multiple SQL dialects
- Migrations and seeders via `sequelize-cli`
- Transaction support
- Eager and lazy loading of relations
- Raw queries and custom validators

## Supported Databases
PostgreSQL, MySQL, MariaDB, SQLite, Microsoft SQL Server
