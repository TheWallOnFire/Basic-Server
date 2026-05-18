# API Design Prompts

Real-world, copy-paste-ready prompts for designing APIs. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Design a REST API

❌ **Weak Prompt**:
```
Design an API for a todo app.
```

✅ **Strong Prompt**:
```
Design a RESTful API for a project management tool (like a simplified Trello).

Core entities: Projects, Boards, Lists, Cards, Users, Comments

Requirements:
- JWT authentication
- Role-based access (owner, admin, member, viewer)
- Pagination on all list endpoints
- Filtering and sorting support

For each endpoint, provide:
| Method | Endpoint | Description | Auth | Request Body | Response |

Design at least:
- 4 CRUD endpoints for Cards
- 2 endpoints for user membership/roles
- 1 batch operation (e.g., move multiple cards)
- 1 webhook endpoint for integrations

Also specify:
- Error response format (standardized across all endpoints)
- Rate limiting strategy
- Versioning approach (URL path vs header)

Follow REST best practices: proper HTTP methods, status codes, and resource naming.
```
