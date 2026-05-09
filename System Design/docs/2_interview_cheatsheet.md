# System Design Interview Cheat Sheet

## The Framework: RESHADED
- **R**equirements: Clarify functional and non-functional (DAU, storage size, etc.).
- **E**stimates: Back-of-the-envelope calculations (TPS, bandwidth, storage).
- **S**ervices: Identify the microservices (Auth, Post, Search).
- **H**igh-level Design: Draw the main components.
- **A**PI Design: Define the endpoints.
- **D**atabase Schema: Choose SQL vs NoSQL and define the model.
- **E**valuate: Discuss bottlenecks and tradeoffs.
- **D**eep Dive: Focus on specific areas requested (Caching, Sharding).

## Back-of-the-envelope numbers to remember
- **L1 Cache**: 0.5 ns
- **SSD Random Read**: 150 µs
- **Round trip (same datacenter)**: 500 µs
- **Round trip (California to Netherlands)**: 150 ms
- **Standard DB Query**: 10-100 ms
- **Max Requests/sec per instance (Node/Python)**: 1k - 10k
