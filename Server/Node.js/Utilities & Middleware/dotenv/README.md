# dotenv

## Description
`dotenv` loads environment variables from a `.env` file into `process.env`. It's the standard way to manage configuration (API keys, database URLs, secrets) in Node.js projects without hardcoding them.

## How to code it
```bash
# .env
PORT=3000
DATABASE_URL=postgresql://user:pass@localhost:5432/mydb
JWT_SECRET=my-super-secret-key
NODE_ENV=development
```

```javascript
// At the very top of your entry file
require('dotenv').config();

// Now use anywhere
const port = process.env.PORT || 3000;
const dbUrl = process.env.DATABASE_URL;
```

### With TypeScript (type-safe env)
```typescript
// env.ts — validate at startup
import { z } from 'zod';

const envSchema = z.object({
  PORT: z.string().transform(Number),
  DATABASE_URL: z.string().url(),
  JWT_SECRET: z.string().min(10),
  NODE_ENV: z.enum(['development', 'production', 'test']),
});

export const env = envSchema.parse(process.env);
```

## Features
- Load `.env` files into `process.env`
- Support for `.env.local`, `.env.production`, etc.
- Zero dependencies
- Used by virtually every Node.js project
