# Code Explanation Prompts

Real-world, copy-paste-ready prompts for understanding code. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Explain a Code Snippet

❌ **Weak Prompt**:
```
What does this code do?

const r = a.reduce((p, c) => (p[c] = (p[c] || 0) + 1, p), {});
```

✅ **Strong Prompt**:
```
Explain the following JavaScript one-liner step by step.

Code:
const r = a.reduce((p, c) => (p[c] = (p[c] || 0) + 1, p), {});

For your explanation:
1. Break down each part of the expression (reduce, callback, comma operator, initial value)
2. Walk through an example with input: a = ["apple", "banana", "apple", "cherry", "banana", "apple"]
3. Show the value of `p` after EACH iteration in a table
4. State what the final value of `r` is
5. Suggest a more readable version of the same logic (multi-line with comments)
```

---

## Example 2 — Explain an Architecture Pattern

❌ **Weak Prompt**:
```
Explain middleware.
```

✅ **Strong Prompt**:
```
Explain the Middleware pattern as used in Express.js.

Structure your explanation as:

1. **Analogy**: A real-world analogy (airport security checkpoint style)
2. **How It Works**: The request lifecycle through middleware (with ASCII diagram)
3. **Code Example**: A complete Express app with 3 middleware:
   - Request logger (logs method, URL, timestamp)
   - Auth checker (verifies a token in the Authorization header)
   - Error handler (catches and formats errors)
4. **Key Rules**: The 3 things every developer must know about `next()`
5. **Common Mistakes**: 2 mistakes beginners make and how to fix them

Target audience: A junior developer who knows JavaScript but is new to Express.
```

---

## Example 3 — Explain a Git Diff

❌ **Weak Prompt**:
```
What changed in this diff?
```

✅ **Strong Prompt**:
```
Analyze the following git diff and explain the changes.

For each changed section:
1. What was the old behavior?
2. What is the new behavior?
3. Why might this change have been made?
4. Are there any potential risks or side effects?

Diff:
"""
- const users = await db.query("SELECT * FROM users WHERE status = 'active'");
+ const users = await db.query(
+   "SELECT id, name, email FROM users WHERE status = $1 AND created_at > $2",
+   ['active', thirtyDaysAgo]
+ );
- return res.json(users);
+ return res.json({ data: users, count: users.length, cached: false });
"""

Rate the overall quality of this change: Good / Needs Improvement / Risky.
```
