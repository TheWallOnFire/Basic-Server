# Node.js Authentication

## Overview
Authentication (AuthN) is the process of verifying who a user is. Authorization (AuthZ) is the process of verifying what they have access to.

## Tools in this Category
- **[Passport.js](./Passport.js/)**: The most popular authentication middleware for Node.js. Supports 500+ "strategies" (Google, Facebook, Local, etc.).
- **[JWT (JsonWebToken)](./JWT/)**: A compact, URL-safe means of representing claims to be transferred between two parties.
- **[bcrypt](./bcrypt/)**: A library to help you hash passwords securely.

## Best Practices
1. **Never store plain-text passwords**. Always hash them with `bcrypt`.
2. **Use HTTPS** for all auth-related traffic.
3. **Use HttpOnly cookies** for storing JWTs to prevent XSS attacks.
