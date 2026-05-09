# tRPC

## Description
tRPC (TypeScript Remote Procedure Call) allows you to build fully type-safe APIs without schemas or code generation. You define your API on the server, and the client gets full autocomplete and type checking — all inferred at compile time.

## How to code it
```typescript
// server.ts
import { initTRPC } from '@trpc/server';
import { z } from 'zod';

const t = initTRPC.create();

const appRouter = t.router({
  getUser: t.procedure
    .input(z.object({ id: z.number() }))
    .query(async ({ input }) => {
      return await db.user.findById(input.id);
    }),

  createUser: t.procedure
    .input(z.object({ name: z.string(), email: z.string().email() }))
    .mutation(async ({ input }) => {
      return await db.user.create(input);
    }),
});

export type AppRouter = typeof appRouter;

// client.ts
import { createTRPCClient } from '@trpc/client';
import type { AppRouter } from './server';

const trpc = createTRPCClient<AppRouter>({ /* config */ });

const user = await trpc.getUser.query({ id: 1 }); // Fully typed!
```

## Features
- End-to-end type safety without code generation
- Works with Zod, Yup, or custom validators
- Subscriptions (WebSocket) support
- Integrates with React (via @trpc/react-query), Next.js
- Batching multiple requests into one HTTP call
