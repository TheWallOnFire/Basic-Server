# The Node.js Event Loop

## 1. What is it?
The Event Loop is what allows Node.js to perform non-blocking I/O operations—despite the fact that JavaScript is single-threaded—by offloading operations to the system kernel whenever possible.

## 2. The Phases
1. **Timers**: Executes callbacks scheduled by `setTimeout()` and `setInterval()`.
2. **Pending Callbacks**: Executes I/O callbacks deferred to the next loop iteration.
3. **Idle, Prepare**: Used only internally.
4. **Poll**: Retrieve new I/O events; execute I/O related callbacks.
5. **Check**: `setImmediate()` callbacks are invoked here.
6. **Close Callbacks**: `socket.on('close', ...)` etc.

## 3. Microtasks (The "In-between" Phases)
- `process.nextTick()`
- `Promise` callbacks
These are executed **immediately** after the current operation completes, regardless of the current phase of the event loop.

## 4. Why it matters
Understanding the Event Loop is key to writing high-performance Node.js code and avoiding "Starvation" (where one task blocks everything else).
