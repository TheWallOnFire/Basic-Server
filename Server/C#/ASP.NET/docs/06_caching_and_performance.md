# 06. Caching & Performance

"The fastest request is the one you never have to make."

---

## 1. In-Memory Caching
Stores data in the local memory of the web server.
- **`IMemoryCache`**: Easy to use for simple data.
- **Caveat**: If you have multiple servers, each one will have its own cache, leading to "stale" data.

---

## 2. Distributed Caching (Redis)
Data is stored in an external service (Redis). All your web servers talk to the same cache.
- **Scalable**: Perfect for large, multi-node applications.
- **Reliable**: Cache survives even if a web server restarts.

---

## 3. Response Caching
Uses HTTP headers to tell the browser (or a proxy) to cache the entire response.
- **`[ResponseCache]`**: Applied to controller actions.
- **VaryByQueryKeys**: Cache different versions based on search parameters.

---

## 4. Output Caching (.NET 7+)
A more advanced version of Response Caching that lives on the server.
- **Invalidation**: You can "tag" items and clear entire groups of cache at once (e.g., "clear everything tagged with 'Products'").
- **Locking**: Prevents "Cache Stampede" (multiple requests trying to compute the same cache item at the same time).

---

## 5. Performance Tips
- **Gzip/Brotli**: Compress your JSON before sending it.
- **Async Everywhere**: Never block a thread with a synchronous call (`.Result` or `.Wait()`).
- **HttpClient Factory**: Use the factory to manage connections and avoid "Socket Exhaustion."

---

## 🚀 Pro Tip
Don't over-cache. Caching adds complexity. Only cache data that is **read often** but **changes rarely**.
