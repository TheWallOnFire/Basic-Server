# Code Review & Refactoring Prompts

Real-world, copy-paste-ready prompts for reviewing and refactoring code. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Security-Focused Code Review

❌ **Weak Prompt**:
```
Review this code for security.
```

✅ **Strong Prompt**:
```
You are an application security specialist. Perform a security audit 
on the following Express.js authentication endpoint.

```js
app.post("/login", async (req, res) => {
  const { username, password } = req.body;
  const user = await db.query(
    `SELECT * FROM users WHERE username = '${username}'`
  );
  if (user && password === user.password) {
    const token = jwt.sign({ id: user.id, role: user.role }, "secret123");
    res.json({ token });
  } else {
    res.status(401).json({ error: "Invalid credentials" });
  }
});
```

For EACH vulnerability found, provide:
| # | Vulnerability | Severity | CWE | Fix |
|---|---|---|---|---|
| 1 | ... | Critical/High/Medium/Low | CWE-XXX | ... |

After the table, provide the fully corrected code implementing ALL fixes.
```

---

## Example 2 — Refactor for Clean Code

❌ **Weak Prompt**:
```
Refactor this code.
```

✅ **Strong Prompt**:
```
Refactor the following function to be more readable and maintainable.
Apply SOLID principles where applicable.

```js
function proc(d) {
  let r = [];
  for (let i = 0; i < d.length; i++) {
    if (d[i].t === 'A' && d[i].s > 100 && d[i].a === true) {
      r.push({ n: d[i].n, v: d[i].s * 0.9 });
    } else if (d[i].t === 'B' && d[i].s > 200) {
      r.push({ n: d[i].n, v: d[i].s * 0.8 });
    } else if (d[i].t === 'A' && d[i].s <= 100) {
      r.push({ n: d[i].n, v: d[i].s });
    }
  }
  r.sort((a, b) => b.v - a.v);
  return r.slice(0, 5);
}
```

Requirements:
- Use descriptive variable and function names
- Extract magic numbers into named constants
- Use modern JavaScript (map/filter/reduce, arrow functions)
- Add TypeScript types
- Add a JSDoc comment explaining the business logic
- Do NOT change the external behavior

Show the refactored code, then list each change made and why.
```
