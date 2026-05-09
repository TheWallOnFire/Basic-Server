# GraphQL (Apollo Server)

## Description
GraphQL is a query language for APIs that lets clients request exactly the data they need. Apollo Server is the most popular GraphQL server implementation for Node.js.

## How to code it
```typescript
import { ApolloServer } from '@apollo/server';
import { startStandaloneServer } from '@apollo/server/standalone';

const typeDefs = `
  type User {
    id: ID!
    name: String!
    email: String!
    posts: [Post!]!
  }

  type Post {
    id: ID!
    title: String!
  }

  type Query {
    users: [User!]!
    user(id: ID!): User
  }

  type Mutation {
    createUser(name: String!, email: String!): User!
  }
`;

const resolvers = {
  Query: {
    users: () => db.users.findAll(),
    user: (_, { id }) => db.users.findById(id),
  },
  Mutation: {
    createUser: (_, { name, email }) => db.users.create({ name, email }),
  },
};

const server = new ApolloServer({ typeDefs, resolvers });
const { url } = await startStandaloneServer(server, { listen: { port: 4000 } });
```

## Features
- Clients fetch exactly what they need (no over/under-fetching)
- Strongly typed schema
- Introspection and auto-generated documentation
- Subscriptions for real-time data
- Apollo Studio for query debugging and monitoring
