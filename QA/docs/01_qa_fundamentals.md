# 01. QA Fundamentals

Quality Assurance (QA) ensures software meets requirements, is free of critical bugs, and delivers a great user experience.

## 1. What is QA?
- **QA (Quality Assurance)**: Process-focused — preventing bugs through better processes.
- **QC (Quality Control)**: Product-focused — finding bugs through testing.
- **Testing**: The act of executing software to verify behavior.

## 2. The SDLC & Where QA Fits
- **Waterfall**: Testing happens after development (risky, slow feedback).
- **Agile/Scrum**: Testing is continuous — QA is embedded in every sprint.
- **Shift-Left Testing**: Moving testing earlier in the development cycle to catch bugs sooner.

## 3. Test Levels (The Testing Pyramid)
```
        /  E2E  \        ← Few, slow, expensive
       /----------\
      / Integration \    ← Some, moderate speed
     /----------------\
    /    Unit Tests     \ ← Many, fast, cheap
```
- **Unit Tests**: Testing individual functions or methods in isolation.
- **Integration Tests**: Testing how components interact with each other.
- **End-to-End (E2E) Tests**: Testing the entire application flow from the user's perspective.

## 4. Test Types
- **Functional**: Does it do what the requirements say?
- **Non-Functional**: Performance, security, usability, accessibility.
- **Regression**: Did the new code break existing functionality?
- **Smoke**: A quick sanity check — does the app even start?
- **Acceptance (UAT)**: Does the user approve the final product?
