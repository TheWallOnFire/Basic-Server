# Jest

## Description
Jest is the most popular JavaScript testing framework, created by Meta (Facebook). It provides a complete testing solution with a test runner, assertion library, mocking, and code coverage — all out of the box with zero configuration.

## How to code it
```javascript
// sum.js
function sum(a, b) { return a + b; }
module.exports = sum;

// sum.test.js
const sum = require('./sum');

test('adds 1 + 2 to equal 3', () => {
  expect(sum(1, 2)).toBe(3);
});

// Async testing
test('fetches user data', async () => {
  const data = await fetchUser(1);
  expect(data.name).toBe('Alice');
});

// Mocking
jest.mock('./database');
const db = require('./database');
db.query.mockResolvedValue([{ id: 1, name: 'Alice' }]);
```

## Features
- Zero-config setup
- Snapshot testing
- Built-in mocking and spying
- Code coverage reports
- Parallel test execution
- Watch mode for development
