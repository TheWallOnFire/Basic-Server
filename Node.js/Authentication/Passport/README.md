# Passport.js

## Description
Passport.js is the most popular authentication middleware for Node.js. It supports 500+ authentication strategies including local (username/password), OAuth (Google, GitHub, Facebook), JWT, SAML, and more.

## How to code it
```javascript
const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;
const JwtStrategy = require('passport-jwt').Strategy;

// Local strategy (username + password)
passport.use(new LocalStrategy(
  async (username, password, done) => {
    const user = await User.findOne({ username });
    if (!user || !await bcrypt.compare(password, user.password)) {
      return done(null, false, { message: 'Invalid credentials' });
    }
    return done(null, user);
  }
));

// JWT strategy
passport.use(new JwtStrategy({
  jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.JWT_SECRET
}, async (payload, done) => {
  const user = await User.findById(payload.sub);
  return done(null, user || false);
}));

// Protect a route
app.get('/profile', passport.authenticate('jwt', { session: false }), (req, res) => {
  res.json(req.user);
});
```

## Features
- 500+ strategies (local, JWT, OAuth, OIDC, SAML)
- Session-based or stateless (JWT) authentication
- Integrates with Express, Koa, Fastify
- Modular (install only the strategies you need)
