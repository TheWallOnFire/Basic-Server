# 08. Debugging & Iterating on Prompts

Writing prompts is an iterative process. Here's a systematic approach to diagnosing and fixing bad prompts.

---

## 1. The Prompt Debugging Loop

```
Write Prompt → Test → Evaluate Output → Diagnose Issue → Fix → Repeat
```

Never settle for "good enough" on the first try. Professional prompt engineers iterate 5-15 times per prompt.

---

## 2. Common Failure Modes & Fixes

### 🔴 Model Ignores Instructions

**Symptom**: Output doesn't follow your rules (wrong format, includes forbidden content).

**Fixes**:
- **Repeat key instructions** at the end of the prompt (recency bias).
- **Use stronger language**: "You MUST..." / "NEVER..." / "ALWAYS..."
- **Use delimiters** to clearly separate instructions from content.
- **Simplify**: Break one complex prompt into multiple simpler ones.

### 🟡 Output is Too Generic

**Symptom**: Vague, surface-level responses that could apply to anything.

**Fixes**:
- **Add specific context**: Industry, tech stack, scale, constraints.
- **Assign an expert role**: "You are a senior X with Y years of experience."
- **Ask for trade-offs**: "Discuss pros, cons, and when NOT to use this."
- **Demand specificity**: "Give exact numbers, code, or configurations."

### 🟠 Model Halluccinates

**Symptom**: Confidently states incorrect facts, invents APIs, or fabricates citations.

**Fixes**:
- **Add grounding**: "Only use information from the provided context."
- **Add honesty constraint**: "If unsure, say 'I don't know'."
- **Use RAG**: Inject verified data into the prompt.
- **Reduce temperature**: Lower values (0-0.3) reduce creative fabrication.

### 🔵 Output is Too Long / Too Short

**Fixes**:
- Be explicit: "Respond in exactly 3 bullet points" or "Keep under 100 words."
- Use output priming to set the format.
- Set `max_tokens` in the API call.

### 🟣 Inconsistent Outputs

**Symptom**: Same prompt gives different quality answers each time.

**Fixes**:
- **Lower temperature** to 0 for deterministic outputs.
- **Use Self-Consistency** (run multiple times, take majority).
- **Add more examples** (Few-Shot) to lock in the pattern.
- **Be more specific** — ambiguity causes variance.

---

## 3. The A/B Testing Framework

When optimizing prompts, test systematically:

```
1. Define your metric (accuracy, format compliance, user satisfaction).
2. Create a test set of 10-20 diverse inputs.
3. Run Prompt A and Prompt B on all inputs.
4. Score each output against your metric.
5. Pick the winner. Iterate on it.
```

### Example Scorecard

| Test Input | Prompt A Score | Prompt B Score | Notes |
| :--- | :--- | :--- | :--- |
| Simple query | 8/10 | 9/10 | B handles format better |
| Edge case | 5/10 | 8/10 | B added constraint helps |
| Adversarial | 3/10 | 7/10 | B's guardrails work |
| **Average** | **5.3** | **8.0** | **Prompt B wins** |

---

## 4. Iteration Strategies

### Strategy 1: Additive Refinement
Start minimal and add instructions as you discover failure modes.
```
v1: "Summarize this article."
v2: "Summarize this article in 3 bullet points."
v3: "Summarize this article in 3 bullet points. Focus on actionable insights."
v4: "Summarize this article in 3 bullet points. Focus on actionable insights. 
     Each bullet should start with a bold verb."
```

### Strategy 2: Negative Constraints
Tell the model what NOT to do based on observed failures.
```
- Do NOT start with "Sure!" or "Great question!"
- Do NOT include disclaimers or caveats.
- Do NOT repeat the question back to me.
- Do NOT use the phrase "it depends" without following up with specifics.
```

### Strategy 3: Show Don't Tell
If instructions aren't working, switch to Few-Shot examples.
```
Instead of: "Be concise and technical."
Do: Provide 2-3 examples of the exact style you want.
```

---

## 5. Prompt Versioning

Track your prompts like code. Use a simple format:

```
# prompt_v3_code_review.md
# Version: 3.0
# Last Updated: 2024-03-15
# Changes: Added severity ratings, fixed JSON output format
# Performance: 85% accuracy on test set (up from 72% in v2)

[Your prompt here]
```

---

## 🚀 Pro Tip

> **Keep a "failure journal."** Every time a prompt fails, write down: (1) what went wrong, (2) why, and (3) how you fixed it. Over time, this becomes your most valuable prompt engineering resource.
