# MongoDB Atlas

## Description
MongoDB Atlas is the official fully-managed cloud database service for MongoDB. It handles provisioning, configuration, patching, backups, and scaling automatically across AWS, Azure, and Google Cloud.

## Key Features
- Fully managed MongoDB clusters (free tier available: M0 Sandbox)
- Multi-cloud and multi-region deployments
- Automated backups with point-in-time recovery
- Atlas Search (Lucene-powered full-text search built into MongoDB)
- Atlas Data Federation (query data across S3, Atlas, and HTTP sources)
- Charts: Built-in data visualization tool
- App Services: Serverless functions and triggers

## How to code it
```javascript
// Same Mongoose/MongoDB driver code — just change the connection string
const mongoose = require('mongoose')

await mongoose.connect('mongodb+srv://user:pass@cluster0.xxxxx.mongodb.net/mydb')

// Everything else is identical to local MongoDB
```

## When to Use
- You want MongoDB without managing infrastructure
- You need global distribution and multi-cloud redundancy
- You want built-in search, analytics, and serverless functions
