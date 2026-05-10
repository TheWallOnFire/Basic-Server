# 16. Evaluation & Observability

If you can't measure your AI system, you can't improve it.

## 1. RAG Evaluation Metrics (The "RAG Triad")
1. **Faithfulness (Groundedness)**: Is the answer based *only* on the provided context? (Prevents hallucinations).
2. **Answer Relevance**: Does the answer actually address the user's question?
3. **Context Precision**: Were the retrieved chunks actually relevant to the question?

## 2. LLM-as-a-Judge
Using a more powerful model (like GPT-4o) to evaluate the output of a smaller model.
- **G-Eval**: A framework for evaluating LLM outputs using multi-step thought processes.
- **DeepEval / RAGAS**: Libraries that automate the calculation of these metrics.

## 3. Observability & Tracing
In a complex agentic system, you need to see every step (trace) of the execution.
- **Traces**: The full path of an execution.
- **Spans**: Individual units of work (e.g., one API call, one retrieval).
- **Tools**:
    - **LangSmith**: Native tracing for LangChain apps.
    - **Arize Phoenix / LangFuse**: Open-source alternatives for tracking traces and evaluations.
    - **Weights & Biases (W&B) Prompts**: Visualizing prompt history.

## 4. Human-in-the-Loop
- **Feedback Loops**: Collecting thumbs-up/down from users to build a "gold dataset."
- **Annotation**: Manually correcting AI outputs to improve future evaluations.

## 5. Security Observability
- **PII Detection**: Automatically flagging if the model leaks sensitive info.
- **Adversarial Monitoring**: Detecting if a user is attempting prompt injection.
