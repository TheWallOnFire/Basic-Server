# Designing a URL Shortener (TinyURL)

A URL shortener takes a long URL and generates a short, unique alias. When users visit the alias, they are redirected to the original long URL.

---

## 1. Requirements

### Functional
- Given a long URL, return a short URL.
- Given a short URL, redirect to the original long URL.
- Links expire after a standard default time, or user-defined time.

### Non-Functional
- **Highly Available**: If the service is down, all shortened links break.
- **Low Latency**: Redirection must happen in real-time.
- **Read-Heavy**: The read-to-write ratio is typically 100:1.

---

## 2. Capacity Estimation
*Assuming 100 million new URLs generated per month and a 10-year storage period.*
- **Write Ops**: 100M / (30 * 24 * 3600) = ~40 URLs/second.
- **Read Ops**: 100:1 ratio = ~4,000 requests/second.
- **Storage**: 100M * 12 months * 10 years * 500 bytes (per URL) = ~6 TB.

---

## 3. High-Level Design

1. **Client** sends long URL to **API Gateway**.
2. **API Gateway** forwards to **Shortener Service**.
3. **Shortener Service** generates a unique ID, converts it to Base62, stores it in the **Database**, and returns the short URL.
4. For redirection, Client hits the short URL. The **Redirection Service** checks the **Cache** first. If missing, it queries the **Database**, updates the Cache, and returns an `HTTP 301` or `302` redirect.

---

## 4. Deep Dive: Generating the Short URL

The core problem is generating a unique short string for billions of URLs.

### Approach 1: Hash + Collision Resolution
Hash the long URL using MD5 or SHA-1, then take the first 7 characters.
- *Problem*: Two different long URLs might hash to the same 7 characters (Collision). Resolving collisions requires database lookups, making generation slow.

### Approach 2: Base62 Conversion (Recommended)
Use a unique, incrementing ID from the database and convert that number to Base62 (A-Z, a-z, 0-9 = 62 characters).
- E.g., Database ID `11157` in Base62 is `2TX`.
- *Why 7 characters?* $62^7 = 3.5$ Trillion combinations, enough for decades.

#### How to get a unique ID at scale?
A single auto-incrementing database becomes a bottleneck.
- **Solution**: Use **ZooKeeper** or a **Ticket Server** pattern to distribute blocks of IDs to different Shortener Service instances. Server A gets IDs 1-1,000,000; Server B gets 1,000,001-2,000,000. They can generate short URLs entirely in-memory without hitting a central DB for an ID.

---

## 5. Database & Caching

### Database Choice
We need to store billions of simple key-value pairs (ShortURL -> LongURL).
- Relational databases (SQL) are fine, but scaling 6TB requires sharding.
- **NoSQL** (e.g., Cassandra, DynamoDB) is ideal here because the data is independent, easily partitionable, and requires high availability and fast reads.

### Caching
To handle 4,000 reads/second with low latency, we must use a cache (e.g., **Redis** or **Memcached**).
- **Eviction Policy**: Least Recently Used (LRU). When the cache is full, remove the URLs that haven't been clicked recently.

---

## 6. HTTP 301 vs HTTP 302
When returning the redirect to the client:
- **301 (Permanent Redirect)**: The browser caches the response. Future clicks go directly to the long URL. Reduces server load, but you lose click analytics.
- **302 (Temporary Redirect)**: The browser hits the shortening server *every time*. Higher server load, but allows you to track click rates and analytics accurately.
