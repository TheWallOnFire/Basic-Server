# Redis Insight

## Description
Redis Insight (formerly RedisInsight) is the official free GUI for Redis by Redis Ltd. It provides a visual interface for browsing keys, running commands, profiling performance, and debugging Redis data structures.

## Key Features
- Visual key browser with filtering and search
- Built-in CLI for running Redis commands
- Memory analysis to find large or idle keys
- Slow log viewer for debugging latency issues
- Support for Redis Streams, JSON, TimeSeries, and Search modules
- Cluster visualization

## How to Install
```bash
# Docker
docker run -d --name redisinsight -p 5540:5540 redis/redisinsight:latest

# Then open http://localhost:5540
```
Or download the desktop app from https://redis.io/insight/

## When to Use
- Browsing and inspecting Redis keys visually
- Debugging cache hit/miss ratios
- Analyzing memory usage of your Redis instance
- Running Redis commands without remembering exact syntax
