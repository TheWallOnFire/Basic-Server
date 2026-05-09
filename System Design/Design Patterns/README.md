# System Design Patterns

## 1. Monolithic Architecture
A single, self-contained application where all components (UI, Business Logic, Data Access) are packaged together.
- **When to use**: Small teams, simple apps, early-stage startups (MVP).

## 2. Microservices Architecture
An application composed of small, independent services that communicate over a network (usually via REST or gRPC).
- **When to use**: Large teams, complex apps, high scale requirements.

## 3. CQRS (Command Query Responsibility Segregation)
Separating the logic for reading data (Query) from the logic for writing data (Command).
- **Why?**: You can optimize your read database for fast lookups (e.g., Elasticsearch) and your write database for consistency (e.g., Postgres).

## 4. Event Sourcing
Instead of storing only the *current state* of an object, you store the *entire history of events* that led to that state.
- **Example**: A bank account doesn't just store "Balance: $100". it stores "Deposit $50", "Withdraw $20", "Deposit $70".

## 5. Peer-to-Peer (P2P)
Nodes communicate directly with each other without a central server.
- **Example**: BitTorrent, WebRTC.

## 6. Serverless
Focusing on code (functions) rather than servers.
- **Example**: AWS Lambda, Google Cloud Run.
