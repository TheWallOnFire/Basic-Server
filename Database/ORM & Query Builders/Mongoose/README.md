# Mongoose

## Description
Mongoose is the most popular Object Data Modeling (ODM) library for MongoDB and Node.js. It provides schema-based modeling, validation, and middleware hooks on top of MongoDB's flexible document structure.

## How it works
MongoDB itself is schema-less — any document can have any fields. Mongoose adds a schema layer on top, defining the shape, types, and validation rules of documents. It then compiles these schemas into Models that provide the API for CRUD operations.

## How to code it

### 1. Define a Schema and Model
```javascript
const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  name:  { type: String, required: true },
  email: { type: String, required: true, unique: true },
  age:   { type: Number, min: 0 },
  role:  { type: String, enum: ['user', 'admin'], default: 'user' },
  createdAt: { type: Date, default: Date.now }
});

// Middleware (pre-save hook)
userSchema.pre('save', function(next) {
  console.log(`Saving user: ${this.name}`);
  next();
});

const User = mongoose.model('User', userSchema);
```

### 2. Connect and CRUD
```javascript
await mongoose.connect('mongodb://localhost:27017/mydb');

// Create
const user = await User.create({ name: 'Alice', email: 'alice@example.com' });

// Read
const users = await User.find({ role: 'admin' });
const alice = await User.findOne({ email: 'alice@example.com' });

// Update
await User.findByIdAndUpdate(user._id, { age: 25 }, { new: true });

// Delete
await User.findByIdAndDelete(user._id);
```

## Features it supports
- Schema-based validation and type casting
- Middleware hooks (pre/post save, validate, remove)
- Population (similar to SQL JOINs for referenced documents)
- Query helpers and virtual properties
- Plugin system for reusable schema features

## Supported Databases
MongoDB only
