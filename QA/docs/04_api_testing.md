# 04. API Testing

APIs are the backbone of modern applications. Testing them ensures data flows correctly between services.

## 1. REST API Testing
- **HTTP Methods**: GET, POST, PUT, PATCH, DELETE.
- **Status Codes**: 200 (OK), 201 (Created), 400 (Bad Request), 401 (Unauthorized), 404 (Not Found), 500 (Server Error).
- **Validation**: Response body, headers, status codes, and response time.

## 2. GraphQL Testing
- **Queries & Mutations**: Validate correct data retrieval and modification.
- **Schema Validation**: Ensure the API schema matches the documentation.
- **Error Handling**: Test malformed queries and unauthorized access.

## 3. Tools
| Tool | Type | Best For |
| :--- | :--- | :--- |
| **Postman** | GUI | Manual API exploration & collections |
| **Insomnia** | GUI | Clean UI, GraphQL support |
| **REST Assured** | Code (Java) | Java-based API automation |
| **Supertest** | Code (JS) | Express.js / Node.js testing |
| **httpx / requests** | Code (Python) | Python API automation |
| **Bruno** | GUI (Git) | Git-friendly API client |

## 4. Contract Testing
- **What**: Verify that the API provider and consumer agree on the data format.
- **Pact**: The most popular contract testing framework.
- **Why**: Prevents integration failures in microservice architectures.

## 5. Key Practices
- Test **happy path** first, then **edge cases**.
- Validate **authentication & authorization** (JWT, OAuth).
- Test **rate limiting** and **pagination**.
- Mock external dependencies with **WireMock** or **MSW**.
