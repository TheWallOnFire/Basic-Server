# Designing a Ride-Hailing App (Uber/Lyft)

A system that connects riders with nearby drivers in real-time, calculates routes, and manages dynamic pricing.

---

## 1. Requirements

### Functional
- Riders can see nearby drivers and request a ride.
- Drivers can accept/reject ride requests.
- Real-time location tracking of the driver during the trip.
- Price calculation based on distance and demand (Surge).

### Non-Functional
- **Low Latency**: Matching must happen quickly.
- **High Consistency**: You cannot dispatch two drivers to the same rider, or assign one driver to two different riders simultaneously.
- **High Write Volume**: Thousands of drivers update their GPS location every 3 seconds.

---

## 2. High-Level Architecture

There are two primary distinct workloads in a ride-hailing app:
1. **The Dispatch / Location System**: Real-time, geospatial, massive write volume.
2. **The Trip / Payment System**: Transactional, highly consistent, historical records.

---

## 3. The Location Tracking Problem
*How do we efficiently find the 5 closest drivers out of 100,000 active drivers?*

You cannot use a standard SQL database and run `SELECT * FROM Drivers WHERE distance < 5 miles` every time someone opens the app. The math is too slow to run across the entire database in real-time.

### Solution: Geospatial Indexing (QuadTrees / Geohash)
We must partition the world into smaller, searchable grids.

#### The QuadTree Approach
- A QuadTree divides a 2D map into 4 quadrants. If a quadrant has too many drivers (e.g., > 100), it subdivides again into 4 smaller quadrants, recursively.
- **Benefit**: Rural areas have huge grid squares. Downtown Manhattan has tiny grid squares.
- When a rider opens the app, we determine which "Grid ID" they are in. We then only search the drivers currently assigned to that specific Grid ID (and adjacent grids), reducing the search space from 100,000 drivers to just 150 drivers.

### The Location Update Firehose
Drivers send GPS updates every 3-5 seconds. This is a massive write load.
- We cannot write this directly to disk (SQL).
- **Solution**: The Location Service stores current driver locations in memory (like **Redis**) and updates the QuadTree in memory. 
- A background worker asynchronously flushes these locations to cold storage (Cassandra/S3) for analytics and dispute resolution.

---

## 4. The Dispatching System
When a rider requests a ride:
1. The **Dispatch Service** queries the Location Service for the nearest available drivers.
2. It filters out drivers who are offline or currently on a trip.
3. It sends a push notification to Driver 1.
4. If Driver 1 rejects or ignores it for 10 seconds, it sends the request to Driver 2.

### Concurrency & Locking
To prevent "Double Booking" (two riders getting the same driver at the exact same millisecond):
- The system must use a Distributed Lock (e.g., using Redis `SETNX` or ZooKeeper) when attempting to assign a driver to a trip.
- Once assigned, the driver's state in the cache immediately changes from "Available" to "Busy".

---

## 5. Route & ETA Calculation
Uber doesn't calculate routes itself; it relies on third-party mapping APIs (like Google Maps or Mapbox) or its own specialized routing engine.
- Routing is computationally expensive (finding the shortest path on a massive graph of roads using Dijkstra's or A* algorithms).
- **Optimization**: The ETA service aggressively caches common routes. The estimated time between "Airport Terminal 1" and "Downtown Hotel" doesn't change significantly minute-to-minute, so the exact route doesn't need to be recalculated for every single request.

---

## 6. Surge Pricing
A stream processing engine (like **Apache Kafka** + **Apache Flink**) continuously analyzes the supply (available drivers) and demand (app opens/requests) in every QuadTree grid.
- If demand > supply in Grid X, the stream processor updates a "Surge Multiplier" value for that grid in a fast cache (Redis).
- When the rider requests an estimate, the pricing service pulls the base rate and multiplies it by the cached surge value.
