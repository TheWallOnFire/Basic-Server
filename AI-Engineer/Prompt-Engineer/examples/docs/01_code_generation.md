# Code Generation Prompts

Real-world, copy-paste-ready prompts for generating code. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Generate a Function

❌ **Weak Prompt**:
```
Write a password validator in JavaScript.
```

✅ **Strong Prompt**:
```
You are a senior security engineer.

Write a JavaScript function called `validatePassword` that:

Input: a string `password`
Output: an object { valid: boolean, errors: string[] }

Rules:
- Minimum 12 characters
- At least 1 uppercase letter
- At least 1 lowercase letter
- At least 1 digit
- At least 1 special character (!@#$%^&*)
- Must NOT contain 3+ consecutive identical characters (e.g., "aaa")
- Must NOT be in a common password list (provide a small hardcoded list)

Requirements:
- Use TypeScript syntax
- Add JSDoc comments
- Include 3 unit test examples at the bottom using console.assert

Return ONLY the code, no explanations.
```

---

## Example 2 — Generate a Full Module

❌ **Weak Prompt**:
```
Create a logger for Node.js.
```

✅ **Strong Prompt**:
```
You are a backend engineer building a production Node.js service.

Create a lightweight logger module in TypeScript with these features:

1. Log levels: DEBUG, INFO, WARN, ERROR (each with its own method)
2. Each log entry must include:
   - ISO 8601 timestamp
   - Log level
   - Message
   - Optional metadata object (serialized as JSON)
3. Output format: JSON (one object per line, for log aggregators)
4. Support a `LOG_LEVEL` environment variable to filter output
   (e.g., setting LOG_LEVEL=WARN suppresses DEBUG and INFO)
5. Use ONLY built-in Node.js modules — no external dependencies

Example usage:
  logger.info("User logged in", { userId: "abc123", ip: "192.168.1.1" })

Expected output:
  {"timestamp":"2024-03-15T10:30:00.000Z","level":"INFO","message":"User logged in","meta":{"userId":"abc123","ip":"192.168.1.1"}}

Return the complete module as a single file.
```

---

## Example 3 — Generate a React Component

❌ **Weak Prompt**:
```
Make a search bar in React.
```

✅ **Strong Prompt**:
```
Create a React search bar component using TypeScript and CSS Modules.

Component: <SearchBar />

Props:
- placeholder: string (default: "Search...")
- onSearch: (query: string) => void
- debounceMs?: number (default: 300)

Behavior:
- Debounce user input before calling onSearch
- Show a loading spinner icon while debounce is pending
- Show a clear "✕" button when input is non-empty
- Pressing Enter triggers onSearch immediately (bypasses debounce)
- Pressing Escape clears the input

Styling:
- Rounded corners, subtle border
- Focus ring on keyboard focus
- Responsive: full width of parent container

Return two files:
1. SearchBar.tsx — the component
2. SearchBar.module.css — the styles
```
