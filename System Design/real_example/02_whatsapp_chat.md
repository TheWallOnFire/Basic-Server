# Designing a Chat Application (WhatsApp/Messenger)

A real-time messaging system allowing 1-on-1 chats, group chats, and online presence tracking.

---

## 1. Requirements

### Functional
- Real-time 1-on-1 message delivery.
- Acknowledgment of messages (Sent, Delivered, Read).
- Track user online/offline status (Presence).
- Push notifications when the user is offline.
- Message history storage.

### Non-Functional
- **Low Latency**: Messages must be delivered in milliseconds.
- **High Consistency**: Messages must be ordered correctly.
- **High Availability**: The system must handle millions of concurrent connections.

---

## 2. High-Level Design: The Connection Problem
Traditional HTTP is "Request-Response." The client asks, the server answers. In a chat app, the server needs to push messages to the client unprompted.

### Why WebSockets?
We use **WebSockets** to establish a persistent, bi-directional connection between the client and the server.
1. User A connects to a Chat Server via WebSocket and stays connected.
2. User B connects to a different Chat Server via WebSocket.
3. When User A sends a message to User B, how does Server A know which server User B is connected to?

### The Session Service
We need a fast, in-memory store (like **Redis**) to map User IDs to the specific Chat Server they are currently connected to.
- `User A` -> `Server 1`
- `User B` -> `Server 3`

When Server 1 receives a message for User B, it queries the Session Service, discovers User B is on Server 3, and routes the message internally to Server 3 via a message queue or RPC.

---

## 3. Core Components

### 1. Chat Servers
Hundreds of stateful servers. Each maintains millions of open WebSocket connections. They do not store messages; they only route them.

### 2. Presence Servers
Dedicated servers to track "Online" or "Last seen at..." status.
- When a user opens the app, they send a heartbeat every 5 seconds.
- If the server doesn't receive a heartbeat within 30 seconds, the user is marked offline.
- *Optimization*: Don't broadcast online status to everyone. Only broadcast it to a user's active friends or current chat windows using a Pub/Sub model.

### 3. Push Notification Servers
If User B is completely offline (no WebSocket connection), the Chat Server sends the message payload to a Push Notification Service (Apple APNs or Google FCM) to wake up the user's phone.

### 4. Storage (Message History)
Chat databases have a massive Write-to-Read ratio. Users generate billions of messages, but rarely read old ones unless scrolling up.
- **Choice**: **Key-Value Store** (like Cassandra or HBase). They handle massive write loads flawlessly and allow fast sequential reads (for scrolling up a chat history).
- **Data Model**: `MessageID` must be sortable by time to guarantee correct message order.

---

## 4. Message Ordering (The Time Problem)
You cannot rely on the client's clock or the chat server's clock to order messages accurately (clock drift).

### Solution: Distributed Sequence Generators
To order messages globally within a specific chat thread, we need a unique, time-sortable ID generator (like **Twitter Snowflake**).
- When a message hits the Chat Server, it gets a Snowflake ID.
- The receiving client sorts incoming messages by this ID to ensure the conversation flows correctly, even if messages arrive out of order due to network latency.

---

## 5. End-to-End Encryption (E2EE)
To ensure privacy (like WhatsApp):
1. User A generates a Public/Private key pair and registers the Public key with the server.
2. User B requests User A's Public key.
3. User B encrypts the message using User A's Public key and sends it to the server.
4. The server cannot read the message. It routes the encrypted blob to User A.
5. User A decrypts it locally using their Private key.
