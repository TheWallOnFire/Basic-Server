# 03. Core Prompting Techniques

These are the fundamental prompting strategies that every AI Engineer must know. They are ranked from simplest to most powerful.

---

## 1. Zero-Shot Prompting

Ask the model to do something **without any examples**. Relies entirely on the model's pre-trained knowledge.

```
Classify the following review as POSITIVE, NEGATIVE, or NEUTRAL:

"The laptop is fast and the screen is beautiful, but the battery life is disappointing."

Classification:
```

**When to use**: Simple tasks where the model already understands the domain (classification, summarization, translation).

**Limitation**: May produce inconsistent output formats or miss edge cases.

---

## 2. Few-Shot Prompting

Provide **2-5 examples** of input → output pairs before asking the model to complete a new one.

```
Classify the sentiment of each review:

Review: "Absolutely love this product! Best purchase ever."
Sentiment: POSITIVE

Review: "It works, nothing special."
Sentiment: NEUTRAL

Review: "Broke after two days. Terrible quality."
Sentiment: NEGATIVE

Review: "The design is sleek but the software crashes constantly."
Sentiment:
```

**When to use**: When zero-shot gives inconsistent results, or when you need a specific output format.

**Tips**:
- Use **diverse examples** that cover edge cases.
- Keep examples **consistent** in format.
- 3-5 examples is usually the sweet spot — more isn't always better.

---

## 3. Chain of Thought (CoT)

Ask the model to **show its reasoning step by step** before giving a final answer.

### Basic CoT
```
Q: A store has 15 apples. They sell 7 in the morning and receive a shipment 
of 12 in the afternoon. How many apples do they have?

A: Let me think step by step:
1. Start with 15 apples.
2. Sell 7: 15 - 7 = 8 apples remaining.
3. Receive 12: 8 + 12 = 20 apples.

The store has 20 apples.
```

### Zero-Shot CoT (Magic Words)
Simply adding **"Let's think step by step"** or **"Think carefully before answering"** to any prompt can significantly improve reasoning accuracy.

```
Q: If it takes 5 machines 5 minutes to make 5 widgets, 
how long would it take 100 machines to make 100 widgets?

Let's think step by step.
```

**When to use**: Math, logic, multi-step reasoning, code debugging, and any task requiring analysis.

**Why it works**: CoT forces the model to "allocate more compute" to the problem by generating intermediate reasoning tokens that influence subsequent predictions.

---

## 4. Instruction Prompting

Give **explicit, imperative instructions** rather than asking questions. Models are trained to follow instructions.

### ❌ Question Style (Weaker)
```
What are some security vulnerabilities in this code?
```

### ✅ Instruction Style (Stronger)
```
Perform a security audit on the following code. Identify all vulnerabilities.
For each vulnerability, provide:
1. The vulnerability type (e.g., SQL Injection, XSS)
2. The exact line(s) of code affected
3. A severity rating (Critical / High / Medium / Low)
4. A concrete fix with corrected code
```

---

## 5. Role Prompting

Assign the model a **specific identity** to bias its responses toward a domain.

```
You are a database performance consultant with 15 years of experience 
optimizing PostgreSQL for high-traffic SaaS applications.

Analyze the following query and suggest optimizations:
SELECT * FROM orders WHERE status = 'pending' ORDER BY created_at DESC;
```

**Pro Tip**: Combine Role + CoT for the best results:
```
You are a senior security researcher. Think step by step and analyze 
the following HTTP request for potential injection attacks.
```

---

## 6. Delimiter-Based Prompting

Use **clear delimiters** (```, """, ###, XML tags) to separate different parts of your prompt. This prevents prompt injection and improves clarity.

```
Summarize the text delimited by triple backticks in exactly 3 bullet points.

Text:
```
Large Language Models (LLMs) are neural networks trained on vast amounts 
of text data. They use transformer architectures to understand and generate 
human language. LLMs can perform tasks like translation, summarization, 
code generation, and question answering without task-specific training.
```

Summary:
```

### XML Tags (Especially Effective for Claude)
```
Translate the content inside <text> tags to French.

<text>
The quick brown fox jumps over the lazy dog.
</text>
```

---

## 7. Output Priming

**Start the model's response** for it to guide the format and style.

```
Extract all email addresses from the following text and return them as a JSON array.

Text: "Contact us at support@example.com or sales@example.com for more info."

Result: [
```

By starting with `[`, you've primed the model to continue with a JSON array.

### More Examples
```
Write a Python function:

def calculate_compound_interest(principal, rate, time):
```

```
Generate a SQL query:

SELECT
```

---

## Technique Comparison

| Technique | Complexity | Best For | Accuracy Boost |
| :--- | :--- | :--- | :--- |
| Zero-Shot | ⭐ | Simple, well-defined tasks | Baseline |
| Few-Shot | ⭐⭐ | Format control, classification | +15-25% |
| Chain of Thought | ⭐⭐ | Reasoning, math, logic | +20-40% |
| Instruction | ⭐⭐ | Detailed, specific output | +10-20% |
| Role Prompting | ⭐ | Domain-specific knowledge | +5-15% |
| Delimiters | ⭐ | Security, clarity | +5-10% |
| Output Priming | ⭐ | Format enforcement | +10-15% |

---

## 🚀 Pro Tip

> **Combine techniques for maximum effect.** The most powerful prompts use Role + Context + Instruction + CoT + Format together. For example: "You are X. Given Y context. Think step by step and Z. Return the result as a table."
