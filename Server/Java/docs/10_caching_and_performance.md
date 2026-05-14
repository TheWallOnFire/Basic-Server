# 10. Caching & Performance

Optimizing Java applications for high load and low latency.

## 1. Spring Cache Abstraction
Simple, annotation-based caching.
```java
@Cacheable("products")
public Product getProduct(Long id) {
    // This expensive method only runs if 'id' is NOT in the cache
}
```

## 2. Cache Providers
- **Caffeine**: High-performance, in-memory cache for single-instance apps.
- **Redis**: The industry standard for distributed caching.
- **Hazelcast**: Distributed in-memory data grid.

## 3. JVM Tuning
- **Garbage Collectors**: Choosing between G1GC (default), ZGC (low latency), or Shenandoah.
- **Memory Settings**: `-Xms` (Initial heap) and `-Xmx` (Max heap).

## 4. GraalVM Native Image
Compiles your Java app into a native executable (like C++ or Go).
- **Pros**: Instant startup, extremely low memory footprint.
- **Cons**: Longer build times, limited reflection/dynamic features.
- **Spring Boot 3**: Has first-class support for Native Images.

## 5. Performance Tools
- **JMH (Java Microbenchmark Harness)**: For precision benchmarking.
- **VisualVM / JConsole**: Basic monitoring.
- **JProfiler / YourKit**: Deep profiling of CPU and memory usage.
