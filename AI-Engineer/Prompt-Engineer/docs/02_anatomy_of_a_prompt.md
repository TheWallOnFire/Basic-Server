# 02. Anatomy of a Prompt

Every effective prompt is composed of up to **6 building blocks**. Not every prompt needs all 6, but understanding them lets you diagnose and improve any prompt.

---

## The 6 Building Blocks

```
┌─────────────────────────────────────────────┐
│  1. ROLE        – Who is the AI?            │
│  2. CONTEXT     – What background info?     │
│  3. TASK        – What should it do?        │
│  4. CONSTRAINTS – What are the rules?       │
│  5. FORMAT      – How should output look?   │
│  6. EXAMPLES    – Show, don't just tell.    │
└─────────────────────────────────────────────┘
```

---

## 1. Role (Persona)

Tell the model **who it is**. This primes its "knowledge distribution" toward a specific domain.

```
You are a senior backend engineer with 10 years of experience in Node.js and PostgreSQL.
```

**Why it works**: LLMs have been trained on text written by many types of people. Assigning a role biases the model toward the vocabulary, reasoning patterns, and knowledge of that persona.

### Good Roles
- `You are a cybersecurity analyst specializing in penetration testing.`
- `You are a technical writer creating API documentation for developers.`
- `You are a data scientist explaining concepts to a non-technical CEO.`

### Bad Roles
- `You are a helpful assistant.` ← Too generic, adds no value.
- `You are the best AI ever.` ← Flattery does not improve output quality.

---

## 2. Context (Background Information)

Provide the **relevant background** the model needs to produce an accurate response.

```
I'm building a REST API with Express.js and Prisma ORM.
The database is PostgreSQL 16 running on AWS RDS.
We use JWT for authentication and have ~50,000 daily active users.
```

**Tips**:
- Only include **relevant** context — don't dump your entire project.
- If context is too long, summarize it or use RAG to inject only the relevant parts.
- Place context **before** the task for better attention.

---

## 3. Task (Instruction)

The **core action** you want the model to perform. This should be a clear, specific, unambiguous instruction.

### ❌ Vague Task
```
Tell me about databases.
```

### ✅ Specific Task
```
Compare PostgreSQL and MongoDB for a real-time analytics dashboard 
that ingests 10,000 events/second. Focus on write throughput, 
query flexibility, and operational complexity.
```

### Power Verbs for Tasks
| Verb | Use When |
| :--- | :--- |
| `Explain` | You want a teaching-style breakdown. |
| `Compare` | You want side-by-side analysis. |
| `Generate` | You want code, content, or data created. |
| `Analyze` | You want critical evaluation of something. |
| `Refactor` | You want code improved without changing behavior. |
| `Debug` | You want help finding and fixing an issue. |
| `Summarize` | You want a concise version of something long. |
| `Translate` | You want conversion between languages/formats. |

---

## 4. Constraints (Rules & Boundaries)

Define **what the model should and should NOT do**. This is where you prevent hallucinations, enforce quality, and control behavior.

```
Rules:
- Do NOT use any external libraries — only built-in Node.js modules.
- Keep the response under 200 words.
- If you don't know the answer, say "I don't know" instead of guessing.
- Do not include any code comments.
- Use TypeScript, not JavaScript.
```

### Common Constraints
- **Length**: "Keep it under 3 paragraphs."
- **Scope**: "Only discuss the backend, not the frontend."
- **Honesty**: "If unsure, say so explicitly."
- **Style**: "Write in a formal, academic tone."
- **Safety**: "Do not generate any harmful or biased content."

---

## 5. Format (Output Structure)

Tell the model **exactly** how you want the output structured. This is one of the most underused yet powerful techniques.

### Markdown Output
```
Return the result as a markdown table with columns:
| Feature | PostgreSQL | MongoDB |
```

### JSON Output
```
Return a JSON object with this exact schema:
{
  "name": "string",
  "severity": "low | medium | high",
  "recommendation": "string"
}
```

### Bullet Points
```
List the top 5 risks as bullet points. Each bullet should have:
- A bold title
- A one-sentence explanation
```

---

## 6. Examples (Few-Shot Learning)

Providing **input → output examples** is one of the most powerful ways to guide model behavior.

```
Convert the following natural language queries to SQL.

Example 1:
Input: "How many users signed up last month?"
Output: SELECT COUNT(*) FROM users WHERE created_at >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month') AND created_at < DATE_TRUNC('month', CURRENT_DATE);

Example 2:
Input: "What are the top 5 products by revenue?"
Output: SELECT product_name, SUM(revenue) as total_revenue FROM orders GROUP BY product_name ORDER BY total_revenue DESC LIMIT 5;

Now convert this:
Input: "Which customers have placed more than 10 orders?"
Output:
```

---

## Putting It All Together

Here is a complete, production-grade prompt using all 6 building blocks:

```
[ROLE]
You are a senior DevOps engineer specializing in Kubernetes and AWS infrastructure.

[CONTEXT]
We have a microservices architecture with 12 services running on EKS (Kubernetes 1.29).
Each service averages 500 requests/second. We currently use an ALB for ingress.
We're experiencing intermittent 502 errors during deployments.

[TASK]
Diagnose the most likely causes of 502 errors during rolling deployments and provide
a concrete solution with Kubernetes manifests.

[CONSTRAINTS]
- Focus only on Kubernetes-level solutions (not application code).
- Assume we're using standard rolling update strategy.
- Do not suggest migrating away from EKS.

[FORMAT]
Structure your response as:
1. Root Cause Analysis (bullet points)
2. Solution (with YAML manifests)
3. Verification Steps (numbered list)

[EXAMPLES]
A similar issue we fixed before was adding readinessProbe with a proper initialDelaySeconds.
```

---

## 🚀 Pro Tip

> **The order matters.** Research shows that LLMs pay the most attention to the **beginning** and **end** of a prompt (the "primacy" and "recency" effects). Place your most critical instructions at the start and repeat key constraints at the end.
