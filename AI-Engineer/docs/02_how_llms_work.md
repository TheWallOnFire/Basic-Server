# 02. How LLMs Work

Understanding the underlying mechanics of Large Language Models is crucial for effective integration and optimization.

## 1. Core Elements
- **Tokens**: The basic unit of text processed by an LLM (words, characters, or sub-words).
- **Context Window**: The maximum number of tokens a model can process in a single interaction.
- **Attention Mechanism**: How the model "focuses" on different parts of the input to understand meaning.

## 2. Sampling Parameters
These parameters control how the model chooses the next token:
- **Temperature**: Controls randomness. Low (0.1) = deterministic/boring; High (0.8+) = creative/random.
- **Top-K**: Limits the model to the top K most likely next tokens.
- **Top-P (Nucleus Sampling)**: Limits choices to a cumulative probability P.
- **Frequency/Presence Penalties**: Discourages the model from repeating the same words.
