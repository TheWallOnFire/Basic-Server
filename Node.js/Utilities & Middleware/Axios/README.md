# Axios

## Description
Axios is the most popular HTTP client for Node.js and browsers. It provides a promise-based API for making HTTP requests with automatic JSON parsing, interceptors, and request/response transformations.

## How to code it
```javascript
const axios = require('axios');

// GET
const { data: users } = await axios.get('https://api.example.com/users');

// POST
const { data: newUser } = await axios.post('https://api.example.com/users', {
  name: 'Alice',
  email: 'alice@example.com'
});

// With config
const response = await axios({
  method: 'put',
  url: '/api/users/1',
  data: { name: 'Bob' },
  headers: { Authorization: `Bearer ${token}` },
  timeout: 5000,
});

// Interceptors (add auth token to every request)
axios.interceptors.request.use(config => {
  config.headers.Authorization = `Bearer ${getToken()}`;
  return config;
});

// Error handling
axios.interceptors.response.use(
  response => response,
  error => {
    if (error.response?.status === 401) logout();
    return Promise.reject(error);
  }
);
```

## Features
- Promise-based API
- Request/response interceptors
- Automatic JSON transforms
- Timeout and cancellation support
- Works in Node.js AND browsers (isomorphic)
