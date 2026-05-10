# 17. AI System Design

Architecting robust, low-latency, and cost-effective AI applications.

## 1. Response Handling
- **Streaming**: Using Server-Sent Events (SSE) to deliver the "first token" immediately, improving perceived latency.
- **Batched Inference**: Combining multiple requests into one call to improve throughput (efficiency).

## 2. Cost & Performance Optimization
- **Token Budgeting**: Limiting input/output tokens to control costs.
- **Cascading Models**: Using a fast, cheap model (GPT-4o-mini) for simple tasks and a powerful model (Claude 3.5 Sonnet) only for complex reasoning.
- **Semantic Caching**: Using `GPTCache` or similar to store answers to similar questions. If a new question is 95% similar to a cached one, return the cached answer.

## 3. Reliability Patterns
- **Fallback**: If OpenAI is down, automatically switch to Anthropic or a local Llama 3 instance.
- **Retries with Exponential Backoff**: Handling rate limits (429 errors) gracefully.
- **Circuit Breaker**: Preventing the system from hammering a failing downstream API.

## 4. State Management
- **Stateless APIs**: The server doesn't "remember" the chat; you must send the history every time.
- **Windowing/Summarization**: As the conversation grows, you must summarize old messages to stay within the context window.

## 5. Deployment Architectures
- **Serverless**: Deploying AI logic in Lambda/Cloud Functions (be careful of cold starts).
- **GPU Cloud**: Deploying your own models on Lambda Labs, RunPod, or Modal.
- **Edge AI**: Running inference on the client (browser/mobile) to save server costs.
