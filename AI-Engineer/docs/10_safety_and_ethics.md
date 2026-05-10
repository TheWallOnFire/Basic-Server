# 10. Safety & Ethics

With great power comes great responsibility. AI Engineers must ensure their applications are safe and ethical.

## 1. Security Risks
- **Prompt Injection**: Users trying to override system instructions.
- **Data Leakage**: Accidentally sending sensitive info to a public API.
- **Insecure Output Handling**: Executing model-generated code without sandboxing.

## 2. Ethical Considerations
- **Bias**: Models reflecting societal prejudices found in training data.
- **Transparency**: Letting users know when they are talking to an AI.
- **Accountability**: Who is responsible when an AI makes a mistake?

## 3. Mitigation Tools
- **Moderation APIs**: Checking for hate speech, violence, or self-harm.
- **Red Teaming**: Proactively trying to "break" the AI to find vulnerabilities.
- **Guardrails**: Libraries like `NeMo Guardrails` or `Guardrails AI` to enforce constraints.
