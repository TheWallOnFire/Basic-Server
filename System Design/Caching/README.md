# Caching Strategy

## Overview
Caching is the process of storing copies of data in a high-speed storage layer (like RAM) to serve future requests faster.

## Caching Layers
1. **Client-side**: Browser cache, Service Workers.
2. **CDN**: Edge caching for static assets (Cloudflare).
3. **API Gateway/Proxy**: Caching full HTTP responses.
4. **Server-side**: Application-level caching (Redis, Memcached).
5. **Database**: Internal query caching.

## Eviction Policies
- **LRU (Least Recently Used)**: Remove the data that hasn't been used for the longest time.
- **LFU (Least Frequently Used)**: Remove the data that is used the least often.
- **FIFO (First In, First Out)**: Remove the oldest data.
