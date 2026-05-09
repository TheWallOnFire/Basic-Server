# Neo4j

## Description
Neo4j is a graph database management system. Described by its developers as an ACID-compliant transactional database with native graph storage and processing, Neo4j is the most popular graph database.

## How it works
Unlike relational databases that rely on tables and JOINs to represent relationships, a graph database uses Nodes (entities) and Edges (relationships) natively. Traversing a graph is incredibly fast because relationships are stored as pointers directly connecting nodes.

## How to code it
Here is an example using the Cypher query language (Neo4j's SQL equivalent):

```cypher
// Create a node
CREATE (alice:Person {name: 'Alice', age: 24})

// Create another node and a relationship
MATCH (a:Person {name: 'Alice'})
CREATE (bob:Person {name: 'Bob', age: 26})
CREATE (a)-[:KNOWS]->(bob)

// Query the graph (Find who Alice knows)
MATCH (a:Person {name: 'Alice'})-[:KNOWS]->(friends)
RETURN friends.name
```

## Features it supports
- Native graph storage and processing (Index-free adjacency)
- Cypher query language optimized for graphs
- High availability and clustering
- Full ACID transactions
- Seamless visualization tools (Neo4j Browser, Bloom)

## Real projects about it
- **ICIJ (Panama Papers)**: Used Neo4j to unravel complex offshore networks.
- **eBay**: Uses Neo4j for same-day delivery routing.
- **Walmart**: Uses Neo4j to optimize product recommendations.
