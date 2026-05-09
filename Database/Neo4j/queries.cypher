// Neo4j Cypher Query Examples

// 1. Create Nodes and Relationships
CREATE (m:Movie {title: 'The Matrix', released: 1999})
CREATE (p:Person {name: 'Keanu Reeves', born: 1964})
CREATE (p)-[:ACTED_IN {roles: ['Neo']}]->(m)

// 2. Read / Match
// Find a specific movie and return it
MATCH (m:Movie {title: 'The Matrix'}) RETURN m

// Find all actors who acted in The Matrix
MATCH (p:Person)-[:ACTED_IN]->(m:Movie {title: 'The Matrix'})
RETURN p.name

// 3. Update
// Add a new property to a node
MATCH (p:Person {name: 'Keanu Reeves'})
SET p.nationality = 'Canadian'
RETURN p

// 4. Delete
// Delete a relationship
MATCH (p:Person {name: 'Keanu Reeves'})-[r:ACTED_IN]->(m:Movie {title: 'The Matrix'})
DELETE r

// Delete a node (must delete relationships first, or use DETACH DELETE)
MATCH (p:Person {name: 'Keanu Reeves'})
DETACH DELETE p

// 5. Complex Traversal (Recommendation)
// Find friends of friends who like a certain movie
MATCH (user:Person {name: 'Alice'})-[:KNOWS]->(:Person)-[:KNOWS]->(fof:Person)
MATCH (fof)-[:LIKES]->(m:Movie {title: 'Inception'})
RETURN fof.name
