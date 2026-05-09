# Firebase

## Description
Firebase (by Google) is a comprehensive Backend-as-a-Service (BaaS) platform. It provides two database products: **Realtime Database** (a JSON tree) and **Cloud Firestore** (a document-based NoSQL database). Firestore is the modern, recommended option.

## Key Features
- Cloud Firestore: Scalable NoSQL document database
- Realtime Database: Low-latency JSON-based syncing
- Built-in authentication (Google, Apple, email, phone, etc.)
- Cloud Functions (serverless Node.js/Python functions)
- Hosting for static sites and SPAs
- Cloud Storage for files
- Analytics and Crashlytics

## How to code it (Firestore)
```javascript
import { initializeApp } from 'firebase/app'
import { getFirestore, collection, addDoc, getDocs, query, where } from 'firebase/firestore'

const app = initializeApp({ /* your config */ })
const db = getFirestore(app)

// Create
await addDoc(collection(db, 'users'), { name: 'Alice', email: 'alice@example.com' })

// Read
const snapshot = await getDocs(collection(db, 'users'))
snapshot.forEach(doc => console.log(doc.id, doc.data()))

// Query
const q = query(collection(db, 'users'), where('name', '==', 'Alice'))
const result = await getDocs(q)
```

## When to Use
- You are building a mobile-first application (iOS, Android, Flutter)
- You need real-time data syncing across devices
- You want zero backend infrastructure management
- Your team is small and needs to ship fast
