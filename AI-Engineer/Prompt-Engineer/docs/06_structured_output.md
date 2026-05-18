# 06. Structured Output

One of the most practical prompt engineering skills is forcing LLMs to return **structured, parseable data** instead of free-form text.

---

## 1. Why Structured Output?

Free-form text is hard to parse programmatically. Structured output lets you:
- **Integrate with code**: Parse JSON directly into objects.
- **Build pipelines**: Chain model outputs as inputs to other systems.
- **Validate**: Check that the model's response matches an expected schema.
- **Display**: Render tables, lists, and formatted data in UIs.

---

## 2. JSON Output

### Basic JSON
```
Extract the following information from the text and return it as JSON:
- name (string)
- age (number)
- skills (array of strings)

Text: "John is a 28-year-old developer who knows Python, TypeScript, and Go."

Return ONLY valid JSON, no additional text:
```

### JSON with Schema
```
Analyze the following error log and return a JSON object matching this schema:

{
  "error_type": "string (one of: syntax, runtime, network, auth)",
  "severity": "string (one of: low, medium, high, critical)",
  "root_cause": "string (1-2 sentences)",
  "fix": "string (actionable recommendation)",
  "affected_services": ["string"]
}

Error log:
"""
[2024-03-15 14:23:01] ERROR: Connection refused to db-primary:5432
[2024-03-15 14:23:02] WARN: Falling back to db-replica:5432
[2024-03-15 14:23:03] ERROR: All database connections exhausted
"""
```

### Enforcing Valid JSON
Tips to prevent broken JSON:
1. **Say "Return ONLY valid JSON"** — prevents preamble text.
2. **Use output priming** — start the response with `{` or `[`.
3. **Use API features** — OpenAI's `response_format: { type: "json_object" }`.
4. **Validate & retry** — Parse the response; if invalid, ask the model to fix it.

---

## 3. Markdown Output

### Tables
```
Compare the following databases. Return the result as a markdown table:

| Feature | PostgreSQL | MongoDB | Redis |
| :--- | :--- | :--- | :--- |
| Type | ... | ... | ... |
| Best For | ... | ... | ... |
| Scaling | ... | ... | ... |
```

### Formatted Reports
```
Write a security audit report using this markdown template:

# Security Audit: [Service Name]

## Summary
[1-2 sentence overview]

## Findings
### 🔴 Critical
- ...

### 🟡 Medium
- ...

### 🟢 Low
- ...

## Recommendations
1. ...
```

---

## 4. CSV / TSV Output

```
Extract all products from the following text and return as CSV 
with headers: name, price, category

Text: "We sell the MacBook Pro for $2499 (laptops), 
AirPods Pro for $249 (audio), and iPad Air for $599 (tablets)."

Output (CSV only, no other text):
```

---

## 5. XML Output

```
Convert the following data to XML format:

Name: Alice Johnson
Role: Senior Engineer
Department: Platform
Projects: Auth Service, API Gateway

Expected format:
<employee>
  <name>...</name>
  <role>...</role>
  ...
</employee>
```

---

## 6. Code Output

### Function Generation
```
Write a TypeScript function with the following signature.
Return ONLY the code, no explanations.

function parseCSV(input: string): Record<string, string>[]
```

### Multi-File Output
```
Generate the following files. Separate each file with a comment 
showing the filename:

// === filename: src/types.ts ===
...

// === filename: src/utils.ts ===
...
```

---

## 7. Model-Specific Features

| Model/API | Structured Output Feature |
| :--- | :--- |
| **OpenAI** | `response_format: { type: "json_object" }` or JSON Schema mode |
| **Anthropic** | Use XML tags `<result>...</result>` for reliable extraction |
| **Google Gemini** | Controlled generation with response MIME types |
| **Ollama** | `format: "json"` parameter in API calls |

---

## 🚀 Pro Tip

> **Always validate structured output programmatically.** Use JSON Schema validators (like `zod` in TypeScript or `pydantic` in Python) to ensure the model's response matches your expected structure. If validation fails, send the error back to the model and ask it to fix the output.
