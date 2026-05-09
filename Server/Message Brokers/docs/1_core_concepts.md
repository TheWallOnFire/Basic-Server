# Message Brokers Core Concepts

## 1. What is a Message Broker?
A message broker is middleware that translates messages between senders (Producers) and receivers (Consumers). It decouples applications so they don't need to know about each other.

## 2. Why Use a Message Broker?
- **Decoupling**: Services communicate through messages, not direct calls.
- **Resilience**: If a consumer is down, messages are queued and processed later.
- **Scalability**: Add more consumers to process messages faster.
- **Load Leveling**: Absorb traffic spikes without overwhelming downstream services.

## 3. Key Messaging Patterns

### Point-to-Point (Queue)
One producer sends a message to a queue. Exactly one consumer picks it up and processes it. Used for task distribution.

### Publish/Subscribe (Pub/Sub)
One producer publishes a message to a topic. All subscribed consumers receive a copy. Used for event broadcasting (e.g., "user signed up" → send email, update analytics, provision account).

### Fan-Out
A message is delivered to all bound queues simultaneously.

### Request-Reply
The producer sends a message and waits for a response from the consumer on a separate reply queue.

## 4. Kafka vs. RabbitMQ

| Feature | Kafka | RabbitMQ |
| :--- | :--- | :--- |
| **Model** | Distributed Log | Message Queue |
| **Message Retention** | Retained (configurable TTL) | Deleted after acknowledgment |
| **Throughput** | Extremely High (millions/sec) | High (thousands/sec) |
| **Message Replay** | Yes (consumers can re-read) | No (once consumed, gone) |
| **Ordering** | Per partition | Per queue |
| **Protocol** | Custom TCP protocol | AMQP, MQTT, STOMP |
| **Best For** | Event streaming, logs, analytics | Task queues, RPC, routing |

## 5. Dead Letter Queues (DLQ)
When a message cannot be processed after multiple retries, it is moved to a Dead Letter Queue instead of being lost. This allows engineers to inspect, debug, and reprocess failed messages later.
