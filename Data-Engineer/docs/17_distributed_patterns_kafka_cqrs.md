# 17. Distributed Patterns: CQRS, Kafka, and the Outbox

In modern microservices, building systems that are both highly consistent and highly scalable requires combining several patterns. This guide explains how **CQRS**, **Event Sourcing**, and **Message Brokers (Kafka)** work together to create an Event-Driven Architecture.

---

## 🏗️ The Architectural Flow

When a user performs an action (e.g., "Place Order"), the system follows this distributed flow:

### 1. The Command (Write Side)
The application receives a command. Instead of just updating a "Current State" table, it performs two actions:
1. Saves the new data to the **Primary Database** (The source of truth).
2. Records an **Event** (e.g., `OrderPlaced`) in a special **Outbox Table** within the same database transaction.

### 2. The Transactional Outbox Pattern
**The Problem**: If you update the DB and then send a message to Kafka, the network might fail after the DB update but before the message is sent. This leads to data inconsistency.
**The Solution**: By saving the event in the **same transaction** as the data update, you guarantee that either both succeed or both fail. A separate "Relay" service then polls the Outbox table and pushes the events to Kafka.

### 3. The Message Broker (Kafka)
**Kafka** acts as the distributed "nervous system." 
- It stores the stream of events immutably.
- It allows multiple services to "subscribe" to the `OrderPlaced` event without the Write side needing to know who they are.

### 4. The Projection (Read Side / CQRS)
A separate **Read Service** consumes the event from Kafka.
- It "projects" the data into a specialized **Read Model** (e.g., an Elasticsearch index or a denormalized SQL table).
- This Read Model is optimized purely for the UI (e.g., a "Customer Order History" screen).

---

## ⚖️ Eventual Consistency
Because the Read Model is updated asynchronously after the Write Model, there is a short window where they might be different. This is called **Eventual Consistency**.
- **User Experience**: The UI might show a "Processing..." spinner until the Read Model is updated.
- **System Stability**: The system is much more resilient because the Write side doesn't wait for the Read side to finish.

---

## 🛠️ Why use Kafka here?
1. **Durability**: If the Read Service goes down, Kafka keeps the messages. When the service comes back, it can "replay" the messages it missed.
2. **Decoupling**: You can add a new "Analytics Service" or "Email Service" that also listens to `OrderPlaced` without changing any code in the Order Service.
3. **High Throughput**: Kafka can handle millions of events per second, far exceeding traditional databases.

---

## 📝 Example: Bank Transfer
1. **Command**: `TransferFunds(from: A, to: B, amount: 100)`
2. **Write Side**: Updates Account A and Account B in a SQL DB. Inserts `FundsTransferred` event into Outbox.
3. **Outbox Relay**: Reads the event and pushes to Kafka topic `bank-events`.
4. **Read Side**: Consumes `bank-events` and updates a "Transaction History" table used by the mobile app.
5. **Notification Side**: Consumes `bank-events` and sends a push notification to both users.
