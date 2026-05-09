# node-cron

## Description
`node-cron` is a lightweight task scheduler for Node.js based on cron syntax. It lets you schedule functions to run at specific times or intervals (e.g., every midnight, every 5 minutes, every Monday at 9 AM).

## How to code it
```javascript
const cron = require('node-cron');

// Every day at midnight
cron.schedule('0 0 * * *', () => {
  console.log('Running daily cleanup...');
  cleanupOldSessions();
});

// Every 5 minutes
cron.schedule('*/5 * * * *', () => {
  console.log('Checking for new orders...');
});

// Every Monday at 9 AM
cron.schedule('0 9 * * 1', () => {
  sendWeeklyReport();
});
```

### Cron Syntax
```
 ┌────────────── second (0-59) (optional)
 │ ┌──────────── minute (0-59)
 │ │ ┌────────── hour (0-23)
 │ │ │ ┌──────── day of month (1-31)
 │ │ │ │ ┌────── month (1-12)
 │ │ │ │ │ ┌──── day of week (0-7, 0=Sun)
 │ │ │ │ │ │
 * * * * * *
```

## Features
- Standard cron expression support
- Timezone support
- Start, stop, and destroy scheduled tasks
- Lightweight (no external dependencies like Redis)
