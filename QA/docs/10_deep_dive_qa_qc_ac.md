# 10. Deep Dive: QA vs QC vs AC

To master the quality track, you must understand the distinction between process, product, and requirements.

---

## 1. QA (Quality Assurance) - "The Prevention"
QA is **process-oriented**. It focuses on improving the software development process to prevent defects from occurring in the first place.

- **Focus**: Process Improvement, Audits, Training.
- **Activity**: Defining coding standards, code reviews, requirements analysis.
- **Goal**: Proactive — "How can we make sure bugs don't happen?"

## 2. QC (Quality Control) - "The Detection"
QC is **product-oriented**. It focuses on identifying defects in the actual product before it is released to users.

- **Focus**: Finding bugs in the software.
- **Activity**: Testing (Manual/Auto), Inspections, Walkthroughs.
- **Goal**: Reactive — "Did we build the product correctly?"

## 3. AC (Acceptance Criteria) - "The Requirement"
Acceptance Criteria are the specific conditions that a software product must meet to be accepted by a user, customer, or other system.

- **Focus**: Business Requirements.
- **Activity**: Writing User Stories, defining "Done" (Definition of Done).
- **Structure**: Often written as **Gherkin** (Given-When-Then).
- **Goal**: Validation — "Are we building the *right* product?"

---

## ⚖️ Comparison Table

| Feature | QA (Assurance) | QC (Control) | AC (Criteria) |
| :--- | :--- | :--- | :--- |
| **Perspective** | Process | Product | Business |
| **Primary Goal** | Prevent Bugs | Find Bugs | Meet Needs |
| **When it happens** | Throughout SDLC | After Development | During Planning |
| **Who owns it** | The Whole Team | Testers/Developers | Product Owner/Stakeholders |
| **Example** | Code Review Process | Running a Test Script | "User can login with Email" |

---

## 📝 Relation Between Them
1. **AC** defines what success looks like.
2. **QA** processes ensure we have the best chance to achieve success.
3. **QC** activities verify that we actually achieved it.

### Example Scenario: Login Page
- **AC**: "User must be able to reset password via email link."
- **QA**: The team decides to use a standard Auth library and conduct pair programming on the reset logic.
- **QC**: A tester runs a script to ensure the email is actually sent and the link works.
