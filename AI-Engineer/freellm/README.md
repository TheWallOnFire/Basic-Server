# 🆓 Free LLM API Resources

This guide provides a curated list of legitimate services that offer free access or trial credits for Large Language Model (LLM) APIs. This is perfect for prototyping without initial costs.

> [!IMPORTANT]
> **Don't abuse these services.** High abuse leads to stricter rate limits or the removal of free tiers for everyone.

---

## 🚀 Top Recommended Free Providers

These services offer consistent free tiers with reasonable rate limits.

### 1. [Google AI Studio](https://aistudio.google.com)
The most generous provider currently, offering access to the Gemini 1.5 Pro and Flash models.
- **Model**: Gemini 1.5 Pro, Gemini 1.5 Flash.
- **Limits**: Up to 15 requests/minute (Flash) and 2 requests/minute (Pro).
- **Note**: Outside of EU/UK, your data may be used to improve Google products.

### 2. [Groq Cloud](https://console.groq.com)
Famous for extreme speed (LPU technology).
- **Models**: Llama 3.1 (8B/70B), Mixtral 8x7B, Gemma 2.
- **Limits**: High token-per-minute (TPM) limits, though subject to frequent changes.
- **Best for**: Real-time applications requiring low latency.

### 3. [OpenRouter](https://openrouter.ai)
An aggregator that provides a single API for almost every model.
- **Free Models**: Often includes Llama 3, Phi-3, and Mistral models.
- **Usage**: Look for models with the `:free` suffix.
- **Best for**: Testing many different models through a single interface.

### 4. [Cerebras](https://cloud.cerebras.ai/)
Extremely fast inference for Llama models.
- **Models**: Llama 3.1 (8B/70B).
- **Speed**: Often reaches 1,000+ tokens per second.

---

## 🛠️ Specialized Free APIs

### [Mistral (Codestral)](https://codestral.mistral.ai/)
- **Focus**: Specifically designed for code generation.
- **Status**: Currently free via a dedicated endpoint for developers.

### [GitHub Models](https://github.com/marketplace/models)
- **Status**: Free for GitHub users (Pro/Copilot users get higher limits).
- **Models**: GPT-4o, Llama 3, Phi-3, Mistral.
- **Best for**: Prototyping directly within the GitHub ecosystem.

---

## 💰 Providers with Trial Credits
These providers give you a one-time credit balance to test their infrastructure.

| Provider | Credits | Best For |
| --- | --- | --- |
| **Fireworks.ai** | $1.00 | High-quality open-source hosting. |
| **Together AI** | $5.00 | Massive library of open models. |
| **AI21 Labs** | $10.00 | Jamba and Jurassic models. |
| **Novita AI** | $0.50 | Stable Diffusion & LLMs. |

---

## 🔗 Original Resource
For a complete, live-updated list of models and specific rate limits, visit the source repository:
[cheahjs/free-llm-api-resources](https://github.com/cheahjs/free-llm-api-resources)

---

## 🚀 Pro Tip
Use an **AI Gateway** (like Portkey or LiteLLM) to rotate between these free keys automatically. If one provider hits a rate limit, the gateway can failover to another free provider, giving you much higher "virtual" limits!
