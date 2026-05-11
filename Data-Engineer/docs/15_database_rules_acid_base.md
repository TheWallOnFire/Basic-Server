# 15. Conventional Database Rules: ACID, BASE, and PACELC

To ensure data integrity and system reliability, databases follow specific sets of rules. Choosing the right "rule set" depends on whether you prioritize absolute correctness or high availability.

---

## 1. ACID (The Gold Standard for RDBMS)
ACID is a set of properties that guarantee database transactions are processed reliably. This is the foundation of Relational Databases (SQL).

- **Atomicity**: "All or Nothing." A transaction is a single unit. If any part of it fails, the entire transaction is rolled back (e.g., a bank transfer: if the debit succeeds but the credit fails, the debit is undone).
- **Consistency**: "Follow the Rules." A transaction must transition the database from one valid state to another, obeying all constraints (FKs, PKs, types).
- **Isolation**: "No Peeking." Transactions happen as if they are the only ones running. One transaction shouldn't see the intermediate state of another.
- **Durability**: "Built to Last." Once a transaction is committed, it stays committed even in the event of a power failure or system crash.

## 2. BASE (The NoSQL Alternative)
For distributed systems that need to scale across the globe (NoSQL), ACID is often too restrictive. BASE offers a more flexible approach.

- **Basically Available**: The system guarantees availability (it will respond), but it might not be the most recent data.
- **Soft State**: The state of the system may change over time, even without input (due to eventual consistency).
- **Eventual Consistency**: The system will become consistent over time, provided no new updates are made to that data point.

## 3. PACELC (The Advanced CAP)
PACELC is an extension of the **[CAP Theorem](./04_cap_theorem.md)**. It describes the trade-offs a system makes when there is a partition (P) and when there is NOT (E - Else).

- **P (Partition)**: If there is a network partition, you must choose between **A**vailability or **C**onsistency (CAP).
- **E (Else)**: If everything is running normally (no partition), you must choose between **L**atency or **C**onsistency.
  - *Example*: MongoDB is usually PA/EC. It prioritizes Consistency even when there is no partition, which might increase latency.

---

## 📊 Summary Comparison

| Feature | ACID | BASE |
| :--- | :--- | :--- |
| **Strictness** | High | Low |
| **Consistency** | Immediate | Eventual |
| **Availability** | Lower (locks data) | Higher |
| **Best For** | Finance, Inventory, Core Apps | Social Media, Real-time Analytics, Big Data |

---

## 💡 Pro Tip
When people ask about "Conventional Rules," they usually want to know **how you handle a failure**.
- Use **ACID** when losing a single record is a catastrophe (e.g., Money).
- Use **BASE** when speed and uptime are more important than being 100% up-to-date for a few seconds (e.g., Likes on a post).
