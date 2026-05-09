# Sentry

## Description
Sentry is an open-source error tracking and performance monitoring platform. It captures runtime errors, exceptions, and crashes from your application in real-time, providing full stack traces with source context to help developers debug issues fast.

## How it works
You install a Sentry SDK into your application. When an unhandled error or exception occurs, the SDK captures the error (with stack trace, breadcrumbs, user context, and environment info) and sends it to the Sentry server. Sentry groups similar errors, tracks their frequency, and alerts your team.

## How to code it (Node.js)
```javascript
const Sentry = require('@sentry/node');

Sentry.init({
  dsn: process.env.SENTRY_DSN,
  environment: process.env.NODE_ENV,
  tracesSampleRate: 0.1,  // 10% of transactions for performance monitoring
});

// Express integration
app.use(Sentry.Handlers.requestHandler());
app.use(Sentry.Handlers.errorHandler());

// Manual capture
try {
  riskyOperation();
} catch (error) {
  Sentry.captureException(error);
}
```

## Features it supports
- Real-time error tracking with full stack traces
- Source map support (readable stack traces from minified code)
- Issue grouping (deduplication of similar errors)
- Performance monitoring (transaction tracing)
- Release tracking (which deploy introduced a bug)
- User feedback widget
- Integrations with Slack, Jira, GitHub, PagerDuty
- Session replay (see exactly what the user did before the crash)

## Supported Platforms
JavaScript, TypeScript, Python, Go, Java, Ruby, PHP, .NET, iOS, Android, Flutter, React Native, Unity
