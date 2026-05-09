# ESLint

## Description
ESLint is a static code analysis tool for identifying problematic patterns found in JavaScript/TypeScript code. it's the industry standard for enforcing code quality and finding potential bugs before runtime.

## How to code it
```javascript
// .eslintrc.json
{
  "env": {
    "node": true,
    "es2021": true
  },
  "extends": [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
    "prettier"
  ],
  "parser": "@typescript-eslint/parser",
  "plugins": ["@typescript-eslint"],
  "rules": {
    "no-console": "warn",
    "prefer-const": "error",
    "@typescript-eslint/no-unused-vars": ["error"]
  }
}
```

## Features
- Finds bugs (syntax errors, undefined variables)
- Enforces coding standards (naming conventions, formatting)
- Huge ecosystem of plugins (React, Node, TypeScript)
- Auto-fix capability (`eslint --fix`)
- Integration with VS Code and CI/CD pipelines
