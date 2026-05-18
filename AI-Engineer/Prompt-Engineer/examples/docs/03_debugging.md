# Debugging & Error Fixing Prompts

Real-world, copy-paste-ready prompts for debugging code. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Fix a Runtime Error

❌ **Weak Prompt**:
```
My code doesn't work. Fix it.

TypeError: Cannot read properties of undefined (reading 'map')
```

✅ **Strong Prompt**:
```
I'm getting a runtime error in my React component. Help me debug it.

Error:
TypeError: Cannot read properties of undefined (reading 'map')
  at UserList (UserList.tsx:12:28)

Code (UserList.tsx):
```tsx
function UserList() {
  const [data, setData] = useState();

  useEffect(() => {
    fetch("/api/users")
      .then(res => res.json())
      .then(json => setData(json));
  }, []);

  return (
    <ul>
      {data.users.map(user => (     // Line 12
        <li key={user.id}>{user.name}</li>
      ))}
    </ul>
  );
}
```

API response format: { "users": [...], "total": 100 }

Please:
1. Explain exactly why this error occurs
2. Identify ALL issues in this code (not just the crash)
3. Provide the corrected code with comments on each fix
4. Add proper loading and error states
```

---

## Example 2 — Fix a Performance Issue

❌ **Weak Prompt**:
```
My query is slow. Make it faster.
```

✅ **Strong Prompt**:
```
The following PostgreSQL query takes 8.2 seconds on a table with 5 million rows.
Help me optimize it.

Slow query:
```sql
SELECT u.name, u.email, COUNT(o.id) as order_count, SUM(o.total) as total_spent
FROM users u
LEFT JOIN orders o ON u.id = o.user_id
WHERE u.created_at > '2024-01-01'
  AND o.status = 'completed'
GROUP BY u.name, u.email
ORDER BY total_spent DESC
LIMIT 50;
```

Table sizes:
- users: 5M rows
- orders: 20M rows

Existing indexes:
- users: PRIMARY KEY (id), INDEX (email)
- orders: PRIMARY KEY (id), INDEX (user_id)

Please:
1. Identify why this query is slow (explain the bottleneck)
2. Suggest which indexes to add (with CREATE INDEX statements)
3. Rewrite the query if the structure can be improved
4. Estimate the expected improvement
5. Show the EXPLAIN ANALYZE I should run to verify
```
