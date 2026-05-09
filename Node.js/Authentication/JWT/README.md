# JSON Web Token (jsonwebtoken)

## Description
`jsonwebtoken` is the standard Node.js library for creating and verifying JSON Web Tokens (JWTs). JWTs are the most common method for stateless authentication in modern REST APIs.

## How to code it
```javascript
const jwt = require('jsonwebtoken');

// Create a token
const token = jwt.sign(
  { userId: user.id, role: user.role },
  process.env.JWT_SECRET,
  { expiresIn: '24h' }
);

// Verify a token (middleware)
function authMiddleware(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'No token' });

  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (err) {
    res.status(403).json({ error: 'Invalid token' });
  }
}

app.get('/protected', authMiddleware, (req, res) => {
  res.json({ message: `Hello user ${req.user.userId}` });
});
```

## Features
- Create (sign) and verify JWTs
- Supports HS256, RS256, ES256 algorithms
- Token expiration and audience/issuer claims
- Stateless — no server-side session storage needed
