# 04. Advanced Prompting Techniques

These techniques go beyond the basics for complex reasoning and production-grade AI systems.

---

## 1. Self-Consistency

Generate **multiple answers** with higher temperature, then pick the **most common** one (majority vote).

```
Prompt (run 5 times with temperature=0.7):

Q: A farmer has 17 sheep. All but 9 die. How many are left?
Let's think step by step.
```

If 4/5 runs produce "9", the answer is **9**. Use the API to generate N completions and take the majority.

---

## 2. Tree of Thought (ToT)

Explore **multiple reasoning branches** and evaluate which path is most promising.

```
For each step:
1. Generate 3 different possible next steps.
2. Evaluate each on a scale of 1-10.
3. Pursue only the most promising branch.
4. If stuck, backtrack and try another branch.
```

**When to use**: Open-ended design problems, strategic planning, creative problem-solving.

---

## 3. ReAct (Reasoning + Acting)

Combine **reasoning** with **tool use** in an interleaved loop. This is the foundation of AI Agents.

```
Thought 1: I need to find the population of Tokyo.
Action 1: search("population of Tokyo 2024")
Observation 1: ~13.96 million.

Thought 2: Now I need the area of France.
Action 2: search("area of France km²")
Observation 2: ~643,801 km².

Thought 3: Now calculate.
Action 3: calculator("13960000 * 643801")
Final Answer: 8,987,461,960,000
```

---

## 4. Meta-Prompting

Ask the model to **write or improve its own prompt**.

```
I want to build an AI that reviews pull requests on GitHub.
Write me the optimal system prompt for this AI, including
role, instructions, constraints, and output format.
```

---

## 5. Least-to-Most Prompting

Break a complex problem into **sub-problems**, solve from simplest to hardest, using each answer as context for the next.

```
Problem: Build a real-time notification system.

Sub-problems (easiest → hardest):
1. What types of notifications exist?
2. How should they be stored?
3. How to deliver in real-time?
4. How to scale to millions of users?
```

---

## 6. Directional Stimulus Prompting (DSP)

Include a **hint** to guide the model toward a specific approach.

```
Write a Python function to find the shortest path in a weighted graph.
Hint: Consider using a priority queue for efficiency.
```

---

## 7. Skeleton of Thought (SoT)

Generate an **outline first**, then flesh out each section for more organized outputs.

```
Step 1: Create a skeleton outline for a blog post. Only output headers.
Step 2: Now expand each section with 2-3 detailed paragraphs.
```

---

## Technique Selection Guide

```
Simple task? → Zero-Shot / Few-Shot
Needs reasoning? → Needs external data? → ReAct
                → One correct answer? → Self-Consistency
                → Open-ended? → Tree of Thought
Complex multi-part? → Least-to-Most
Long-form output? → Skeleton of Thought
Stuck? → Meta-Prompting
```

---

## 🚀 Pro Tip

> **The more structured reasoning you ask the model to do, the better its output will be.** Emerging techniques like MCTS prompting and Graph of Thought continue this trend.
