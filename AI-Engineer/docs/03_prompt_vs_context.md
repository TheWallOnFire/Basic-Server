# 03. Prompt vs. Context Engineering

Effective AI engineering is often about how you talk to the model (Prompts) and what information you give it (Context).

## 1. Prompt Engineering
- **Zero-Shot**: Asking without examples.
- **Few-Shot**: Providing a few examples in the prompt to guide the output.
- **Chain of Thought (CoT)**: Encouraging the model to "think step by step".
- **ReAct**: Combining Reasoning and Acting (calling tools).
- **Structured Output**: Forcing the model to return JSON or other specific formats.

## 2. Context Engineering
- **External Memory**: Providing the model with access to external data.
- **Retrieval Augmented Generation (RAG)**: Dynamically injecting relevant context into the prompt.
- **Context Compaction**: Summarizing or filtering long context to fit in the window.
- **Context Isolation**: Ensuring the model doesn't get confused by conflicting information.
