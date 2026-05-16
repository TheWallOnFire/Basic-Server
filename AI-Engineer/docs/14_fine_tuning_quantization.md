# 14. Fine-tuning & Quantization

Adapting models to specific domains and optimizing them to run on consumer hardware.

## 1. Fine-tuning vs. RAG
- **RAG**: Providing external knowledge at inference time (best for dynamic data).
- **Fine-tuning**: Teaching the model a new "style," "format," or "static knowledge" (best for behavior and domain-specific vocabulary).

## 2. PEFT (Parameter-Efficient Fine-Tuning)
Instead of updating billions of parameters, PEFT techniques only update a small subset.
- **LoRA (Low-Rank Adaptation)**: Injects small trainable matrices into the model's layers. Reduces VRAM requirements by 10x-100x.
- **QLoRA**: Combines LoRA with 4-bit quantization, allowing you to fine-tune a 70B model on a single consumer GPU.

## 3. Fine-tuning Process
1. **Dataset Preparation**: Collecting instruction-response pairs (JSONL).
2. **Formatting**: Using templates like ChatML or Alpaca.
3. **Training**: Using libraries like `unsloth`, `axolotl`, or `HF TRL`.
4. **Merging**: Combining the LoRA weights back into the base model.

## 4. Quantization (Compression)
Making models smaller so they run faster and fit in less VRAM.
- **GGUF (llama.cpp)**: Optimized for CPU + GPU inference (most common for local LLMs).
- **AWQ / GPTQ**: Highly optimized for pure GPU inference (server-side).
- **EXL2**: Extremely fast inference for ExLlamaV2.
- **BitNet / 1.58-bit**: The future of "nearly weightless" models.

## 5. Tools
- **Unsloth**: The fastest library for local fine-tuning.
- **Ollama**: For running quantized GGUF models easily.
- **AutoGPTQ / AutoAWQ**: For quantizing your own models.

---

> [!TIP]
> Ready to run these models on your own machine? Check out the **[Running Models Locally Guide](../Running-Models-Locally/README.md)**.
