# bcrypt

## Description
`bcryptjs` / `bcrypt` is the standard library for hashing passwords in Node.js. It uses the bcrypt algorithm which includes a salt by default and is intentionally slow to prevent brute-force attacks.

## How to code it
```javascript
const bcrypt = require('bcryptjs');

// Hash a password (during registration)
const salt = await bcrypt.genSalt(10);
const hashedPassword = await bcrypt.hash('user-password', salt);
// Store hashedPassword in database

// Compare passwords (during login)
const isMatch = await bcrypt.compare('user-password', hashedPassword);
if (isMatch) {
  // Login successful
}
```

## Features
- Automatic salt generation
- Configurable cost factor (rounds)
- Constant-time comparison (timing attack safe)
- Pure JS version (`bcryptjs`) — no native build required
