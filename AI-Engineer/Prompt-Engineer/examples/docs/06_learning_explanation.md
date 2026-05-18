# Learning & Explanation Prompts

Real-world, copy-paste-ready prompts for learning new concepts and technologies. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Explain a Concept at Multiple Levels

❌ **Weak Prompt**:
```
Explain Docker.
```

✅ **Strong Prompt**:
```
Explain Docker containers at 3 levels of depth:

### Level 1 — ELI5 (For a non-technical person)
Use a real-world analogy. No jargon. Max 3 sentences.

### Level 2 — Junior Developer
Explain what containers are, how they differ from VMs, and why they matter.
Include a simple diagram (ASCII art). Use technical terms but define them.

### Level 3 — Senior Engineer
Cover:
- How containers use Linux namespaces and cgroups under the hood
- The layered filesystem (UnionFS/OverlayFS)
- Security implications (container escapes, rootless containers)
- When NOT to use containers

End with a comparison table:
| Aspect | Containers | Virtual Machines |
```

---

## Example 2 — Teach Me a New Technology

❌ **Weak Prompt**:
```
Teach me Redis.
```

✅ **Strong Prompt**:
```
I'm a backend developer who knows PostgreSQL well but has never used Redis.
Teach me Redis in a practical, hands-on way.

Structure:
1. **What & Why** (3 sentences: what Redis is, what it's NOT, why I'd use it alongside PostgreSQL)
2. **Mental Model** (how to think about Redis if I come from SQL — what's the equivalent of tables, rows, queries?)
3. **Top 5 Use Cases** (with a one-liner each: caching, sessions, rate limiting, etc.)
4. **Hands-On Tutorial**: Walk me through these commands with explanations:
   - SET/GET a string
   - Store a user session as a Hash
   - Use a Sorted Set for a leaderboard
   - Set a key with TTL (expiration)
   - Use pub/sub for real-time notifications
5. **Integration Example**: Show a Node.js Express snippet that uses Redis for API response caching
6. **Pitfalls**: 3 things beginners get wrong with Redis

Keep it concise — I learn best from code examples, not long paragraphs.
```

---

## Example 3 — Compare Technologies

❌ **Weak Prompt**:
```
REST vs GraphQL?
```

✅ **Strong Prompt**:
```
Compare REST and GraphQL for a mobile e-commerce app with 100K daily users.

Structure the comparison as:

1. **Architecture Diagram**: ASCII art showing how each handles a "product listing with reviews" request
2. **Side-by-Side Code**: Show the same feature (fetch product + reviews + seller info) implemented in both REST and GraphQL
3. **Decision Matrix**:
   | Criteria | REST | GraphQL | Winner |
   | Over-fetching | ... | ... | ... |
   | Caching | ... | ... | ... |
   | Learning curve | ... | ... | ... |
   | Mobile performance | ... | ... | ... |
   | Tooling | ... | ... | ... |
4. **When to Pick REST**: 3 scenarios
5. **When to Pick GraphQL**: 3 scenarios
6. **Verdict**: Your recommendation for this specific use case and why

Be opinionated — don't say "it depends" without following up with a concrete recommendation.
```
