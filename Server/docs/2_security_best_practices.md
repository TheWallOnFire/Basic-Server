# Backend Security Best Practices

## 1. Authentication & Authorization
- **Never store plain passwords**: Use `bcrypt` or `argon2`.
- **Use JWT or Sessions**: Secure your tokens with `HttpOnly` and `Secure` flags.
- **RBAC (Role-Based Access Control)**: Define clear permissions for different user levels.

## 2. Data Validation & Sanitization
- **Trust no one**: Validate every input from the user.
- **Prevent SQL Injection**: Use ORMs or Parameterized Queries.
- **Prevent XSS**: Sanitize HTML inputs and use security headers (`Helmet`).

## 3. Communication Security
- **Use HTTPS everywhere**: SSL/TLS is mandatory for production.
- **Rate Limiting**: Prevent Brute-force and DoS attacks.
- **CORS**: Correctly configure Cross-Origin Resource Sharing.

## 4. Infrastructure Security
- **Secrets Management**: Never commit `.env` files. Use Vault or AWS Secrets Manager.
- **Dependency Scanning**: Use `npm audit` or Snyk to find vulnerable packages.
- **Least Privilege**: Your app should only have the permissions it absolutely needs to run.
