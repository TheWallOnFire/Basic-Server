# Project Explanation Prompts

Example prompts for getting AI to explain your projects clearly — for READMEs, onboarding, presentations, or your own understanding. Each shows a ❌ weak prompt and a ✅ strong prompt.

---

## Example 1 — Explain an Entire Codebase

❌ **Weak Prompt**:
```
Explain my project.
```

✅ **Strong Prompt**:
```
I'm going to share the folder structure and key files of my project.
Explain the entire codebase as if you're onboarding a new developer.

Project structure:
[paste your tree output here]

For your explanation, provide:
1. **Project Overview** (2-3 sentences: what it does, who it's for, what problem it solves)
2. **Architecture Diagram** (ASCII art showing how the main components connect)
3. **Folder-by-Folder Breakdown**: For each top-level folder, explain:
   - Its purpose (1 sentence)
   - Key files inside and what they do
   - How it relates to other folders
4. **Data Flow**: Trace a typical user request from entry point to response
5. **Key Design Decisions**: What patterns are used (MVC, Clean Architecture, etc.) and why they likely were chosen

Keep explanations concise — use bullet points, not paragraphs.
```

---

## Example 2 — Explain a Project's Architecture

❌ **Weak Prompt**:
```
What's the architecture of this app?
```

✅ **Strong Prompt**:
```
Analyze the following project and explain its architecture.

Tech stack: Node.js, Express, PostgreSQL, Redis, Docker
Key files:
- src/index.ts (entry point)
- src/routes/ (API endpoints)
- src/services/ (business logic)
- src/repositories/ (database access)
- src/middleware/ (auth, logging, error handling)
- docker-compose.yml (multi-container setup)

Explain:
1. **Architecture Pattern**: What pattern is this project using? (Layered, Clean, Hexagonal, etc.)
   Draw the layer diagram with ASCII art showing the dependency direction.
2. **Request Lifecycle**: Trace a POST /api/users request through every layer
   (Router → Middleware → Controller → Service → Repository → DB → Response)
3. **Dependency Graph**: Which modules depend on which? Are there any circular dependencies?
4. **Separation of Concerns**: Rate how well the project separates concerns (1-10) and explain why.
5. **Scalability Assessment**: What would need to change to handle 100x traffic?

Target audience: A mid-level developer joining the team.
```

---

## Example 3 — Explain a Project to Non-Technical Stakeholders

❌ **Weak Prompt**:
```
Explain my app to my boss.
```

✅ **Strong Prompt**:
```
I built a web application and need to explain it to non-technical stakeholders 
(CEO, product managers, investors).

Project: An internal dashboard that monitors server health, tracks API errors,
and sends Slack alerts when something breaks.

Tech: React frontend, FastAPI backend, PostgreSQL, WebSocket for real-time updates.

Create a non-technical explanation that covers:
1. **The Problem** (2 sentences: what pain point does this solve?)
2. **The Solution** (explain what the app does using a restaurant kitchen analogy — 
   dashboard = window into the kitchen, alerts = smoke detector, logs = receipts)
3. **Key Features** (5 bullet points, each with a user-friendly name and 1-sentence benefit)
   Example: "🔔 Smart Alerts — Get notified on Slack the moment something breaks, 
   before customers notice."
4. **Impact** (quantify: "Reduces downtime detection from 30 minutes to 30 seconds")
5. **What's Next** (2-3 future improvements in business language, not tech jargon)

Rules:
- NO technical terms (no "API", "WebSocket", "PostgreSQL")
- If you must reference a technical concept, immediately follow with an analogy
- Keep the entire explanation under 300 words
```

---

## Example 4 — Explain a Specific Feature / Module

❌ **Weak Prompt**:
```
How does the auth system work?
```

✅ **Strong Prompt**:
```
Explain the authentication and authorization system in my project.

Here are the relevant files:

```ts
// middleware/auth.ts
[paste code]

// services/authService.ts  
[paste code]

// routes/auth.routes.ts
[paste code]
```

Explain:
1. **Auth Flow Diagram**: ASCII flowchart showing: 
   Login → Token generation → Token storage → Authenticated request → Token validation
2. **Authentication vs Authorization**: How does the project handle each? Which middleware does what?
3. **Token Strategy**: What type of tokens are used (JWT, session, etc.)? 
   What data is stored in the token? What's the expiration strategy?
4. **Security Analysis**: Rate the security of this implementation (1-10).
   List any vulnerabilities or missing best practices:
   | Issue | Severity | Recommendation |
5. **Edge Cases**: How does the system handle:
   - Expired tokens?
   - Invalid tokens?
   - Missing tokens?
   - Concurrent sessions?
```

---

## Example 5 — Explain a Project for a README

❌ **Weak Prompt**:
```
Write a description of my project.
```

✅ **Strong Prompt**:
```
I need a compelling project description for my GitHub README.

Project details:
- Name: TaskFlow
- What it does: A CLI tool that converts natural language to project tasks, 
  creates GitHub issues, and assigns them to team members
- Tech: Python, Click, OpenAI API, GitHub API
- Target users: Engineering team leads managing small teams (5-15 people)
- Unique selling point: Uses AI to break down vague requirements into actionable tasks

Write the following sections:

1. **One-liner** (badge-style tagline, max 15 words)
   Example style: "🚀 Turn messy requirements into organized GitHub issues in seconds."

2. **Problem Statement** (3 sentences: the pain, the current workaround, why it sucks)

3. **Solution** (3 sentences: what TaskFlow does, how it's different, the key insight)

4. **Demo** (describe a terminal session showing the tool in action — 
   use a realistic example with input command and output)
   ```bash
   $ taskflow create "Build user authentication with OAuth2 and email/password"
   ```

5. **Features List** (6 bullet points with emoji, bold name, and 1-sentence description)

6. **How It Works** (numbered steps, max 5, showing the pipeline from input to output)

Tone: Professional but energetic. Avoid buzzwords like "leverage" or "cutting-edge."
```

---

## Example 6 — Explain a Project's Database Design

❌ **Weak Prompt**:
```
Explain my database.
```

✅ **Strong Prompt**:
```
Analyze and explain the database design of my project.

Schema (from migrations or Prisma schema):
```prisma
[paste your schema here]
```

Provide:
1. **Entity Relationship Diagram**: ASCII art showing tables, their columns (PK, FK), 
   and relationships (1:1, 1:N, N:M)
2. **Table-by-Table Breakdown**:
   | Table | Purpose | Key Columns | Relationships |
3. **Normalization Level**: What normal form is this schema in? Are there any denormalized fields and why might that be intentional?
4. **Query Patterns**: Based on the schema, what are the 5 most likely common queries? 
   Write them as SQL.
5. **Missing Indexes**: Based on likely query patterns, which indexes should exist but don't?
6. **Potential Issues**: Any design concerns (N+1 risk, missing soft deletes, 
   no audit trail, etc.)?
7. **Scaling Considerations**: What would need to change at 1M, 10M, 100M rows?
```

---

## Example 7 — Explain a Project for a Job Interview

❌ **Weak Prompt**:
```
Help me explain my project in an interview.
```

✅ **Strong Prompt**:
```
I need to explain a personal project in a technical interview (senior backend role).
Help me prepare a structured, impressive explanation.

Project: A real-time collaborative document editor (like Google Docs, simplified)
Tech Stack: Next.js, WebSocket (Socket.io), Redis Pub/Sub, PostgreSQL, Docker
Scale: Handles ~50 concurrent users per document

Prepare:
1. **30-Second Elevator Pitch**: A concise, impressive summary that shows 
   technical depth without being overwhelming.

2. **Architecture Walkthrough** (what I'd draw on a whiteboard):
   - Component diagram with data flow arrows
   - Explain why each technology was chosen over alternatives

3. **Hardest Technical Challenge**: 
   Frame using STAR method (Situation, Task, Action, Result).
   Focus on the conflict resolution algorithm (OT vs CRDT — which I chose and why).

4. **Anticipated Interview Questions** and strong answers:
   - "How do you handle conflicts when two users edit the same line?"
   - "How would you scale this to 10,000 concurrent users?"
   - "What would you do differently if you rebuilt it from scratch?"
   - "How do you test real-time features?"

5. **Metrics & Impact**: Help me quantify:
   - Latency (how fast edits sync)
   - Reliability (uptime, data loss prevention)
   - Performance (concurrent users, document sizes)

Tone: Confident and technical, like I'm explaining to a peer engineer.
```

---

## Example 8 — Explain How to Set Up & Run a Project

❌ **Weak Prompt**:
```
How do I run this project?
```

✅ **Strong Prompt**:
```
Write a complete "Getting Started" guide for my project that a developer 
can follow from zero to running the app locally.

Project info:
- Language: TypeScript (Node.js 20)
- Package manager: pnpm
- Database: PostgreSQL 16
- Cache: Redis 7
- Containerization: Docker Compose
- Environment variables needed: DATABASE_URL, REDIS_URL, JWT_SECRET, PORT

Structure the guide as:

1. **Prerequisites**: List exact versions with install links
   Format: ✅ Node.js >= 20.0 — [install](link)

2. **Clone & Install**:
   ```bash
   # exact commands
   ```

3. **Environment Setup**:
   - Show the .env.example file with descriptions for each variable
   - Which variables are required vs optional
   - How to generate secrets (e.g., `openssl rand -hex 32`)

4. **Database Setup**:
   - Option A: Docker (for convenience)
   - Option B: Local install (for existing setups)
   - How to run migrations
   - How to seed sample data

5. **Run the App**:
   ```bash
   # development mode with hot reload
   # production mode
   # with Docker Compose (entire stack)
   ```

6. **Verify It Works**:
   - Health check endpoint to hit
   - Expected response
   - Common errors and their fixes (table format)

7. **Troubleshooting FAQ**:
   | Error | Cause | Fix |
```

---

## 🚀 How to Use These

1. **Pick the scenario** that matches your need (onboarding, interview, README, etc.)
2. **Replace the placeholder content** with your actual project details
3. **Paste the relevant code/schema** where indicated
4. **Customize the output format** to match your audience (technical vs non-technical)

> **Tip**: The more context you give about your project (code, structure, tech stack), the more accurate and useful the explanation will be.
