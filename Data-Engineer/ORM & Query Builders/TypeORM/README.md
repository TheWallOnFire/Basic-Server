# TypeORM

## Description
TypeORM is an ORM that can run in Node.js and the browser. It supports both Active Record and Data Mapper patterns, and is designed to work seamlessly with TypeScript (while also supporting JavaScript).

## How it works
TypeORM uses TypeScript decorators (`@Entity`, `@Column`, `@PrimaryGeneratedColumn`) to define the structure of your database tables directly in your class definitions. It then maps these classes to SQL tables and provides a repository API for CRUD operations.

## How to code it

### 1. Define an Entity
```typescript
import { Entity, PrimaryGeneratedColumn, Column, OneToMany } from 'typeorm';
import { Post } from './Post';

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column()
    name: string;

    @Column({ unique: true })
    email: string;

    @OneToMany(() => Post, post => post.author)
    posts: Post[];
}
```

### 2. CRUD with Repository
```typescript
import { AppDataSource } from './data-source';
import { User } from './entity/User';

const userRepo = AppDataSource.getRepository(User);

// Create
const user = userRepo.create({ name: 'Alice', email: 'alice@example.com' });
await userRepo.save(user);

// Read
const users = await userRepo.find({ relations: { posts: true } });

// Update
await userRepo.update(1, { name: 'Alice Updated' });

// Delete
await userRepo.delete(1);
```

## Features it supports
- Active Record and Data Mapper patterns
- TypeScript decorator-based schema definition
- Automatic migrations and schema sync
- Query Builder for complex queries
- Supports transactions, caching, and logging

## Supported Databases
PostgreSQL, MySQL, MariaDB, SQLite, MS SQL Server, Oracle, CockroachDB
