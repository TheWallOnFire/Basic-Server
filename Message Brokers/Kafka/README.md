# Kafka

## Description
Apache Kafka is an open-source distributed event streaming platform used by thousands of companies for high-performance data pipelines, streaming analytics, data integration, and mission-critical applications.

## How it works
Kafka is fundamentally a distributed commit log. Producers publish messages (events) to "topics", and Consumers subscribe to those topics to process the events. Kafka brokers store these events partitioned across a cluster for high throughput, fault tolerance, and durability. Unlike traditional message queues, Kafka retains messages for a specified period, allowing consumers to replay them.

## How to code it
Here is a basic example of producing a message in Node.js using `kafkajs`:

```javascript
const { Kafka } = require('kafkajs');

const kafka = new Kafka({
  clientId: 'my-app',
  brokers: ['localhost:9092']
});

const producer = kafka.producer();

async function run() {
  await producer.connect();
  await producer.send({
    topic: 'test-topic',
    messages: [
      { value: 'Hello World from Kafka!' },
    ],
  });
  await producer.disconnect();
}

run();
```

## Features it supports
- Extremely high throughput and low latency
- Persistent and durable storage of events
- Publish-Subscribe messaging model
- Stream processing via Kafka Streams
- Horizontal scalability

## Real projects about it
- **LinkedIn**: Originally developed Kafka to handle activity streams and operational metrics.
- **Uber**: Uses Kafka heavily to route real-time telemetry data.
- **Spotify**: Relies on Kafka for its massive event delivery system.
