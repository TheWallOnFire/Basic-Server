# Node.js Core Concepts

## 1. The Event Loop
Node.js is single-threaded but handles concurrency through an event-driven, non-blocking I/O model. The Event Loop is the core mechanism:
1. **Call Stack**: Executes synchronous code.
2. **Callback Queue**: Holds callbacks from completed async operations (timers, I/O).
3. **Microtask Queue**: Holds `Promise` callbacks and `process.nextTick()` (higher priority than Callback Queue).
4. The Event Loop continuously checks: Is the Call Stack empty? If yes, push the next item from the Microtask Queue (then Callback Queue) onto the stack.

## 2. Modules System
- **CommonJS (CJS)**: `require()` / `module.exports` — synchronous, used by default in Node.js.
- **ES Modules (ESM)**: `import` / `export` — asynchronous, use `.mjs` extension or `"type": "module"` in `package.json`.

## 3. npm (Node Package Manager)
- `npm init` — Initialize a project.
- `npm install <package>` — Install a dependency.
- `npm install -D <package>` — Install a dev dependency.
- `package.json` — Manifest file listing dependencies, scripts, and metadata.
- `package-lock.json` — Locks exact dependency versions for reproducible builds.

## 4. Middleware Pattern
The middleware pattern is central to Node.js web frameworks. A middleware function has access to the request (`req`), response (`res`), and a `next()` function. It can:
- Execute code.
- Modify the request/response objects.
- End the request-response cycle.
- Call `next()` to pass control to the next middleware.

## 5. Streams
Streams are used for handling large amounts of data efficiently by processing it in chunks rather than loading everything into memory:
- **Readable**: `fs.createReadStream()`
- **Writable**: `fs.createWriteStream()`
- **Duplex**: Both readable and writable (e.g., TCP sockets).
- **Transform**: Modify data as it passes through (e.g., `zlib.createGzip()`).
