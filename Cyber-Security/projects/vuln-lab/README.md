# 🛡️ Vulnerability Lab (Juice Shop)

A pre-configured, safe environment to practice web penetration testing and defense using the world-famous OWASP Juice Shop.

## 🏗️ Architecture
- **Target**: OWASP Juice Shop (intentionally vulnerable Node.js app).
- **Toolbox**: A sidecar container or local installation of Burp Suite/OWASP ZAP.
- **Network**: Isolated Docker bridge network for safe testing.

## 🛠️ Stack
- **Orchestration**: Docker Compose
- **Target App**: Node.js / Express
- **Database**: SQLite / MongoDB

## 🚀 Getting Started
1. Install Docker and Docker Compose.
2. Start the lab:
   ```bash
   docker-compose up -d
   ```
3. Open your browser to `http://localhost:3000`.
4. Start hunting for vulnerabilities!

## 🧪 Learning Goals
- **SQL Injection**: Bypass login screens.
- **XSS (Cross-Site Scripting)**: Execute scripts in other users' sessions.
- **Broken Authentication**: Exploit weak session management.
- **Sensitive Data Exposure**: Find hidden files and leaked information.
