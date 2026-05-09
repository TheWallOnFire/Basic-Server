# BullMQ

## Description
BullMQ is the most popular job queue library for Node.js, built on top of Redis. It processes background tasks (sending emails, image processing, report generation) outside of your main request-response cycle.

## How to code it
```typescript
import { Queue, Worker } from 'bullmq';
import Redis from 'ioredis';

const connection = new Redis({ maxRetriesPerRequest: null });

// Producer: add jobs to the queue
const emailQueue = new Queue('email', { connection });

await emailQueue.add('welcome-email', {
  to: 'alice@example.com',
  subject: 'Welcome!',
  body: 'Thanks for signing up.'
}, {
  delay: 5000,          // Wait 5 seconds before processing
  attempts: 3,          // Retry up to 3 times on failure
  backoff: { type: 'exponential', delay: 2000 },
});

// Consumer: process jobs
const worker = new Worker('email', async (job) => {
  console.log(`Sending email to ${job.data.to}`);
  await sendEmail(job.data);
}, { connection, concurrency: 5 });

worker.on('completed', (job) => console.log(`Job ${job.id} completed`));
worker.on('failed', (job, err) => console.log(`Job ${job.id} failed: ${err}`));
```

## Features
- Delayed and scheduled jobs (cron-like)
- Priority queues
- Rate limiting
- Job retries with exponential backoff
- Progress tracking
- Repeatable jobs (cron expressions)
- Bull Board (visual dashboard)
