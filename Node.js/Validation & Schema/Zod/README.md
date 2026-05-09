# Zod

## Description
Zod is a TypeScript-first schema declaration and validation library. It lets you define a schema once and infer the TypeScript type from it — eliminating the need to write both a validator and a type definition.

## How to code it
```typescript
import { z } from 'zod';

const UserSchema = z.object({
  name: z.string().min(2).max(50),
  email: z.string().email(),
  age: z.number().int().positive().optional(),
  role: z.enum(['user', 'admin']).default('user'),
});

// Infer TypeScript type from schema
type User = z.infer<typeof UserSchema>;

// Validate
const result = UserSchema.safeParse(req.body);
if (!result.success) {
  return res.status(400).json(result.error.flatten());
}
const user: User = result.data; // Fully typed!
```

## Features
- Zero dependencies, 8KB minified
- TypeScript type inference from schema
- Composable (merge, extend, pick, omit schemas)
- Works everywhere (Node.js, browser, React Native)
- Integrates with tRPC, React Hook Form, Fastify
