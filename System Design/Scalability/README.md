# Scalability: Vertical vs. Horizontal

## 1. Vertical Scaling (Scaling Up)
Increasing the capacity of a single machine (e.g., adding more CPU or RAM to a server).
- **Pros**: Simple, no code changes required, low latency (no network calls).
- **Cons**: Hard limit (there's only so much RAM you can put in one machine), expensive, single point of failure.

## 2. Horizontal Scaling (Scaling Out)
Adding more machines to your resource pool (e.g., adding more servers behind a load balancer).
- **Pros**: Infinite scale, high availability (if one machine dies, others take over), cost-effective (use many cheap machines).
- **Cons**: Complex (requires load balancers, service discovery), data consistency issues, network latency.

---

## Performance vs. Scalability
- **Performance**: Making a single request faster (e.g., optimizing a SQL query).
- **Scalability**: Handling *more* requests at the same time (e.g., adding more replicas of the app).

## Latency vs. Throughput
- **Latency**: The time it takes for a single request to complete.
- **Throughput**: The number of requests processed in a given time (e.g., 1000 requests per second).

---

## Ideal Goal
In modern system design, we always strive for **Horizontal Scalability**. It allows us to grow our system linearly with our user base without hitting a hardware ceiling.
