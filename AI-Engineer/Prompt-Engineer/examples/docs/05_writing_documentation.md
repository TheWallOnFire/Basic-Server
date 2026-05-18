# Writing & Documentation Prompts

Real-world, copy-paste-ready prompts for writing docs and technical content. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Write a README

❌ **Weak Prompt**:
```
Write a README for my project.
```

✅ **Strong Prompt**:
```
Write a professional README.md for the following open-source project.

Project: "LogStream" — A real-time log aggregation and search tool
Tech Stack: Go backend, React frontend, ClickHouse database, WebSocket for streaming
Target Users: DevOps engineers and SREs

Include these sections:
1. Project banner description (1-2 compelling sentences)
2. Key Features (5-6 bullet points with emoji icons)
3. Architecture diagram (ASCII art showing components)
4. Quick Start (Docker Compose setup in < 5 commands)
5. Configuration (table of environment variables)
6. API Reference (3 most important endpoints as a table)
7. Contributing guidelines (brief)
8. License (MIT)

Style:
- Use GitHub-flavored markdown
- Include code blocks with syntax highlighting
- Keep it scannable — use headers, tables, and bullet points
- Tone: Professional but approachable
```

---

## Example 2 — Write API Documentation

❌ **Weak Prompt**:
```
Document this API endpoint.
```

✅ **Strong Prompt**:
```
Write API documentation for the following endpoint in OpenAPI/Swagger style markdown.

Endpoint: POST /api/v1/invoices

Functionality: Creates a new invoice for a customer.

Include:
1. **Description**: What it does, who should use it
2. **Authentication**: Bearer token required
3. **Request Body**: JSON schema with all fields, types, required/optional, constraints
4. **Response**: Success (201) and Error (400, 401, 404, 500) response schemas
5. **Example Request**: A complete cURL command
6. **Example Response**: Both success and error cases
7. **Rate Limiting**: 100 requests per minute per API key
8. **Notes**: Any gotchas or important behaviors

Here's the handler code for reference:
```js
async function createInvoice(req, res) {
  const { customerId, items, dueDate, currency = "USD", notes } = req.body;
  // items: [{ description: string, quantity: number, unitPrice: number }]
  // dueDate: ISO 8601 string, must be in the future
  // currency: ISO 4217 code, default USD
  const invoice = await Invoice.create({ customerId, items, dueDate, currency, notes });
  return res.status(201).json(invoice);
}
```
```
