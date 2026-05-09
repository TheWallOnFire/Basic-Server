# Prettier

## Description
Prettier is an opinionated code formatter. It removes all original styling and ensures that all outputted code conforms to a consistent style by parsing your code and re-printing it with its own rules.

## How to code it
```json
// .prettierrc
{
  "semi": true,
  "trailingComma": "all",
  "singleQuote": true,
  "printWidth": 80,
  "tabWidth": 2
}
```

## Why it's useful
- **No more styling debates**: The team doesn't argue over tabs vs spaces or semicolons.
- **Save time**: Developers don't spend time manually formatting code.
- **Easier Diffing**: Git diffs are cleaner because only logic changes, not formatting.
- **Auto-format on save**: Integrated with VS Code.
