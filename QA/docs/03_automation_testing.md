# 03. Automation Testing

Automation testing uses scripts and tools to execute tests automatically, enabling faster feedback and higher coverage.

## 1. When to Automate
- ✅ Repetitive regression tests.
- ✅ Data-driven tests with many input combinations.
- ✅ Smoke tests that run on every build.
- ❌ Exploratory testing.
- ❌ Tests that change frequently.
- ❌ One-time tests.

## 2. Web UI Frameworks
| Framework | Language | Key Strength |
| :--- | :--- | :--- |
| **Playwright** | JS/TS/Python/C# | Modern, auto-wait, multi-browser |
| **Cypress** | JavaScript | Fast, great DX, time-travel debug |
| **Selenium** | Multi-language | Industry standard, widest adoption |
| **Puppeteer** | JavaScript | Chrome/Chromium focused |

## 3. Unit Testing Frameworks
| Framework | Language |
| :--- | :--- |
| **Jest** | JavaScript/TypeScript |
| **Vitest** | JavaScript/TypeScript (Vite) |
| **pytest** | Python |
| **JUnit** | Java |
| **xUnit / NUnit** | C# |
| **Go testing** | Go |

## 4. Test Design Patterns
- **Page Object Model (POM)**: Separate page structure from test logic.
- **Fixtures & Factories**: Generate test data consistently.
- **AAA Pattern**: Arrange → Act → Assert.
- **Given-When-Then (BDD)**: Behavior-Driven Development with Cucumber/Gherkin.

## 5. Best Practices
- Tests should be **independent** — no test depends on another.
- Tests should be **deterministic** — same result every time.
- Tests should be **fast** — slow tests get ignored.
- Use **meaningful assertions** — not just "no error".
