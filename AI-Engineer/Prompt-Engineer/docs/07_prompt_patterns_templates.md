# 07. Prompt Patterns & Templates

Reusable, battle-tested prompt architectures for common AI engineering tasks.

---

## 1. The CRISP Framework

A universal template for any prompt. **C**ontext, **R**ole, **I**nstruction, **S**tructure, **P**roof-check.

```
[Context]    I'm building a REST API for an e-commerce platform.
[Role]       You are a senior API designer.
[Instruction] Design the endpoints for the checkout flow.
[Structure]  Return as a table: Method | Endpoint | Description | Request Body
[Proof-check] After generating, review for RESTful best practices and fix any issues.
```

---

## 2. Code Review Pattern

```
Review the following code for:
1. Security vulnerabilities
2. Performance issues  
3. Code quality and readability
4. Edge cases and error handling

For each issue found, provide:
- **Line(s)**: The affected line numbers
- **Severity**: Critical / High / Medium / Low
- **Issue**: What's wrong
- **Fix**: The corrected code

If no issues are found, say "No issues found."

Code:
```[paste code]```
```

---

## 3. Explain Like I'm [X] Pattern

```
Explain [CONCEPT] at three levels:

1. **ELI5** (Explain Like I'm 5): Use a simple analogy.
2. **Junior Dev**: Use technical terms with clear definitions.
3. **Senior Eng**: Assume deep knowledge, focus on nuances and trade-offs.
```

---

## 4. Decision Matrix Pattern

```
I need to choose between [Option A], [Option B], and [Option C] for [USE CASE].

Create a decision matrix with these criteria:
- Performance
- Cost
- Learning curve
- Community support
- Scalability

Rate each option 1-5 for each criterion. Add a weighted total 
(performance and scalability are 2x weight). Recommend the best option 
with justification.
```

---

## 5. Debugging Pattern

```
I'm encountering the following error:

Error:
"""
[paste error message]
"""

Code:
"""
[paste relevant code]
"""

Environment: [Node.js 20, PostgreSQL 16, Ubuntu 22.04]

Please:
1. Explain what this error means.
2. Identify the root cause in my code.
3. Provide the exact fix with corrected code.
4. Explain how to prevent this in the future.
```

---

## 6. Documentation Generator Pattern

```
Generate comprehensive documentation for the following function/API.

Include:
- **Description**: What it does (1-2 sentences)
- **Parameters**: Table with name, type, required?, description
- **Returns**: What it returns
- **Throws**: Possible errors
- **Example**: A working code example
- **Notes**: Any caveats or edge cases

Code:
```[paste code]```
```

---

## 7. Test Case Generator Pattern

```
Generate test cases for the following function.

Include:
- Happy path tests (normal inputs)
- Edge cases (empty, null, boundary values)
- Error cases (invalid inputs, exceptions)
- Performance considerations

Use [Jest/Pytest/Go testing] syntax.
Each test should have a descriptive name following the pattern:
"should [expected behavior] when [condition]"

Function:
```[paste code]```
```

---

## 8. System Design Pattern

```
Design a system for [USE CASE] that handles [SCALE].

Structure your response as:
1. **Requirements**: Functional and non-functional
2. **High-Level Architecture**: Components and their interactions
3. **Data Model**: Key entities and relationships
4. **API Design**: Core endpoints
5. **Scaling Strategy**: How to handle growth
6. **Trade-offs**: What you optimized for and what you sacrificed
```

---

## 9. Refactoring Pattern

```
Refactor the following code to improve [readability / performance / maintainability].

Requirements:
- Do NOT change the external API/behavior.
- Apply [SOLID principles / DRY / specific pattern].
- Add TypeScript types if missing.
- Keep the refactored code production-ready.

Show the refactored code followed by a bullet-point list of changes made and why.

Code:
```[paste code]```
```

---

## 10. Translation Pattern (Natural Language → Code)

```
Convert the following business requirement into [Python/TypeScript/SQL] code.

Requirement:
"""
[paste business requirement in plain English]
"""

Rules:
- Use descriptive variable names.
- Add error handling for edge cases.
- Include inline comments explaining business logic.
- Write a brief docstring.
```

---

## 🚀 Pro Tip

> **Build a personal prompt library.** Save your best prompts in a markdown file or a tool like [Langfuse](https://langfuse.com) or [PromptLayer](https://promptlayer.com). Version them, test them against different models, and iterate based on results. The best prompt engineers have hundreds of tested templates.
