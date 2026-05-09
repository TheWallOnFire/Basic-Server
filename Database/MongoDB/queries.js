// MongoDB CRUD Operations Example
// Run this file in the MongoDB shell using: mongosh < queries.js

// Switch to (or create) the database
db = db.getSiblingDB('student_db');

// 1. Create / Insert
db.students.insertOne({
    first_name: "Alice",
    last_name: "Wonderland",
    email: "alice@example.com",
    age: 22,
    major: "Computer Science",
    enrollment_date: new Date()
});

db.students.insertMany([
    { first_name: "Bob", last_name: "Builder", email: "bob@example.com", age: 24, major: "Engineering" },
    { first_name: "Charlie", last_name: "Chaplin", email: "charlie@example.com", age: 21, major: "Arts" }
]);

// 2. Read / Find
// Find all students
db.students.find().pretty();

// Find students in a specific major
db.students.find({ major: "Computer Science" }).pretty();

// 3. Update
// Update a single document
db.students.updateOne(
    { email: "alice@example.com" },
    { $set: { age: 23, status: "active" } }
);

// 4. Delete
// Delete a single document
db.students.deleteOne({ email: "bob@example.com" });

// 5. Aggregation
// Count how many students are in each major
db.students.aggregate([
    { $group: { _id: "$major", totalStudents: { $sum: 1 } } }
]);
