# Supabase

## Description
Supabase is an open-source Firebase alternative built on top of PostgreSQL. It provides a full backend-as-a-service with a Postgres database, real-time subscriptions, authentication, storage, and edge functions — all accessible via auto-generated REST and GraphQL APIs.

## Key Features
- Full PostgreSQL database with a visual Table Editor
- Auto-generated REST API (PostgREST) — no backend code needed for CRUD
- Real-time subscriptions (listen to database changes via WebSockets)
- Built-in authentication (email/password, OAuth, magic links)
- File storage (S3-compatible)
- Edge Functions (serverless Deno functions)
- Row-Level Security (RLS) policies for fine-grained access control

## How to code it
```javascript
import { createClient } from '@supabase/supabase-js'

const supabase = createClient('https://your-project.supabase.co', 'your-anon-key')

// Read
const { data: users } = await supabase.from('users').select('*')

// Insert
await supabase.from('users').insert({ name: 'Alice', email: 'alice@example.com' })

// Real-time subscription
supabase.channel('users').on('postgres_changes',
  { event: 'INSERT', schema: 'public', table: 'users' },
  (payload) => console.log('New user:', payload.new)
).subscribe()
```

## When to Use
- You want a full backend without writing backend code
- You want PostgreSQL power with a Firebase-like developer experience
- You need real-time features
