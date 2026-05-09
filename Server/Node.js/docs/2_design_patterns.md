# Node.js Design Patterns

## 1. Middleware Chain Pattern
Used by Express, Koa, and Fastify. Functions are chained together, each processing the request before passing it to the next.
```javascript
app.use(logger);
app.use(authenticate);
app.use(authorize);
app.get('/data', handler);
```

## 2. Error-First Callback Pattern
The original Node.js convention: the first argument of a callback is always an error object.
```javascript
fs.readFile('file.txt', (err, data) => {
    if (err) return console.error(err);
    console.log(data);
});
```

## 3. Singleton Pattern
Ensure only one instance of a module exists (e.g., a database connection pool). Node's `require()` caches modules by default, making every module a natural singleton.

## 4. Factory Pattern
Create objects without specifying the exact class. Useful for creating different types of database connections or loggers based on configuration.
```javascript
function createLogger(type) {
    if (type === 'file') return new FileLogger();
    if (type === 'console') return new ConsoleLogger();
}
```

## 5. Observer / Event Emitter Pattern
Node.js has a built-in `EventEmitter` class. Objects emit named events that cause listeners to be called.
```javascript
const EventEmitter = require('events');
const emitter = new EventEmitter();
emitter.on('userCreated', (user) => sendWelcomeEmail(user));
emitter.emit('userCreated', { name: 'Alice' });
```

## 6. Repository Pattern
Abstract the data access layer behind a clean interface so the business logic doesn't know whether data comes from a database, API, or cache.
```javascript
class UserRepository {
    async findById(id) { /* query DB */ }
    async save(user) { /* insert/update DB */ }
    async delete(id) { /* delete from DB */ }
}
```
