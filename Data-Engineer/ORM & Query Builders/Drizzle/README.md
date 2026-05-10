# Drizzle ORM

## Description
Drizzle ORM is a lightweight, performant TypeScript ORM with a "SQL-like" API. Its philosophy is "If you know SQL, you know Drizzle." It provides full type safety without code generation.

## How it works
Unlike Prisma (which generates a client from a schema file), Drizzle defines schemas directly in TypeScript. The schema IS the source of truth, and the query API mirrors SQL syntax almost 1:1. This makes it extremely predictable — you always know what SQL will be generated.

## How to code it

### 1. Define Schema
```typescript
import { pgTable, serial, text, integer, timestamp } from 'drizzle-orm/pg-core';

export const users = pgTable('users', {
  id: serial('id').primaryKey(),
  name: text('name').notNull(),
  email: text('email').unique().notNull(),
  createdAt: timestamp('created_at').defaultNow()
});

export const posts = pgTable('posts', {
  id: serial('id').primaryKey(),
  title: text('title').notNull(),
  authorId: integer('author_id').references(() => users.id)
});
```

### 2. Query (SQL-like API)
```typescript
import { drizzle } from 'drizzle-orm/node-postgres';
import { eq } from 'drizzle-orm';
import { users, posts } from './schema';

const db = drizzle(pool);

// Select
const allUsers = await db.select().from(users);

// Select with where
const alice = await db.select().from(users).where(eq(users.email, 'alice@example.com'));

// Insert
await db.insert(users).values({ name: 'Alice', email: 'alice@example.com' });

// Update
await db.update(users).set({ name: 'Bob' }).where(eq(users.id, 1));

// Join
const result = await db.select()
  .from(users)
  .leftJoin(posts, eq(users.id, posts.authorId));
```

## Features it supports
- Zero code generation — schema is plain TypeScript
- SQL-like query builder (very predictable output)
- Drizzle Kit for automatic migrations
- Drizzle Studio (visual database browser)
- Extremely lightweight and fast

## Supported Databases
PostgreSQL, MySQL, SQLite (including Turso, Neon, PlanetScale, Vercel Postgres)
