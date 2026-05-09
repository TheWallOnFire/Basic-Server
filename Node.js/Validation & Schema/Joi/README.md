# Joi

## Description
Joi is the most popular data validation library for JavaScript, originally created for the Hapi framework. It provides a powerful, expressive schema description language for validating JavaScript objects.

## How to code it
```javascript
const Joi = require('joi');

const userSchema = Joi.object({
  name: Joi.string().min(2).max(50).required(),
  email: Joi.string().email().required(),
  age: Joi.number().integer().min(0).max(120),
  role: Joi.string().valid('user', 'admin').default('user'),
  password: Joi.string().pattern(/^[a-zA-Z0-9]{8,30}$/),
  confirmPassword: Joi.ref('password'),
});

const { error, value } = userSchema.validate(req.body, { abortEarly: false });
if (error) {
  return res.status(400).json({ errors: error.details });
}
```

## Features
- Rich, expressive validation API
- Custom error messages
- Conditional validation (`when`)
- Reference other fields (`Joi.ref`)
- Type coercion (string → number)
- Battle-tested in production (Hapi ecosystem)
