# 08. Security Testing

Security testing identifies vulnerabilities in your application before attackers do.

## 1. Testing Types
- **SAST (Static Application Security Testing)**: Scanning source code for vulnerabilities *without* running it.
- **DAST (Dynamic Application Security Testing)**: Testing a running application for vulnerabilities.
- **IAST (Interactive)**: Combining SAST and DAST with runtime analysis.
- **SCA (Software Composition Analysis)**: Scanning dependencies for known CVEs.

## 2. OWASP Top 10
The most critical web application security risks:
1. Broken Access Control.
2. Cryptographic Failures.
3. Injection (SQL, XSS, Command).
4. Insecure Design.
5. Security Misconfiguration.
6. Vulnerable Components.
7. Authentication Failures.
8. Software & Data Integrity Failures.
9. Logging & Monitoring Failures.
10. Server-Side Request Forgery (SSRF).

## 3. Tools
| Tool | Type | Best For |
| :--- | :--- | :--- |
| **OWASP ZAP** | DAST | Free, comprehensive web scanner |
| **Burp Suite** | DAST | Professional pen testing |
| **Snyk** | SCA/SAST | Dependency vulnerability scanning |
| **SonarQube** | SAST | Code quality + security |
| **Trivy** | SCA | Container & IaC scanning |
| **Semgrep** | SAST | Fast, custom rule scanning |

## 4. Penetration Testing
- **Black Box**: No knowledge of the system.
- **White Box**: Full knowledge of code and architecture.
- **Grey Box**: Partial knowledge (most realistic).
