# Prisma

## Description
Prisma is a next-generation Node.js and TypeScript ORM that provides a type-safe database client, automated migrations, and a visual data management studio.

## How it works
Prisma uses a declarative `schema.prisma` file to define your data models. From this schema, it generates a fully type-safe client (`@prisma/client`) that you import into your application. Every query is autocompleted and validated at compile time. Prisma Migrate reads your schema changes and generates SQL migration files automatically.

## How to code it

### 1. Define your schema (`prisma/schema.prisma`)
```prisma
datasource db {
  provider = "postgresql"
  url      = env("DATABASE_URL")
}

generator client {
  provider = "prisma-client-js"
}

model User {
  id        Int      @id @default(autoincrement())
  email     String   @unique
  name      String?
  posts     Post[]
  createdAt DateTime @default(now())
}

model Post {
  id       Int    @id @default(autoincrement())
  title    String
  content  String?
  author   User   @relation(fields: [authorId], references: [id])
  authorId Int
}
```

### 2. Generate client and run migrations
```bash
npx prisma migrate dev --name init
npx prisma generate
```

### 3. Use in your application
```typescript
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient()

// Create
const user = await prisma.user.create({
  data: { email: 'alice@example.com', name: 'Alice' }
})

// Read with relations
const usersWithPosts = await prisma.user.findMany({
  include: { posts: true }
})

// Update
await prisma.user.update({
  where: { email: 'alice@example.com' },
  data: { name: 'Alice Updated' }
})

// Delete
await prisma.user.delete({ where: { id: 1 } })
```

## Features it supports
- 100% type-safe database queries (TypeScript)
- Auto-generated migrations from schema
- Prisma Studio (visual database browser)
- Supports PostgreSQL, MySQL, SQLite, SQL Server, MongoDB, CockroachDB
- Raw SQL escape hatch when needed

## Supported Databases
PostgreSQL, MySQL, MariaDB, SQLite, SQL Server, MongoDB, CockroachDB, PlanetScale
