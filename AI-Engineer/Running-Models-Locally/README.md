# 🏠 Running LLMs Locally

Running Large Language Models (LLMs) locally allows you to maintain data privacy, work offline, and avoid API costs. This guide covers the best tools and methods for local deployment.

---

## 1. Why Run Locally?
- **Data Privacy**: Your data never leaves your machine.
- **Cost Efficiency**: No pay-per-token fees.
- **No Internet Required**: Perfect for secure or offline environments.
- **Customization**: Use specific models, quantizations, and system prompts.

---

## 2. Hardware Requirements
Local LLMs are hardware-intensive. The primary bottleneck is **VRAM** (Video RAM).
- **Minimum**: 8GB RAM (runs small 3B models like Llama 3-3B).
- **Recommended**: 16GB+ RAM or an NVIDIA GPU with 8GB+ VRAM (runs 7B-8B models smoothly).
- **Power User**: 24GB+ VRAM (NVIDIA RTX 3090/4090) or Mac M2/M3 Max (runs 30B+ models).

---

## 3. Top Tools for Local Running

### 🟢 Ollama (Easiest)
Ollama is a lightweight, command-line based tool that makes running LLMs as easy as `docker`.
- **[Detailed Ollama Guide](./Ollama/README.md)**: Installation, Commands, and Modelfiles.
- **Website**: [ollama.com](https://ollama.com)
  ```bash
  ollama run llama3
  ```
- **API**: It automatically starts a local server at `http://localhost:11434`.

### 🟡 LM Studio (Best GUI)
A beautiful desktop application for searching, downloading, and chatting with local models.
- **[Detailed LM Studio Guide](./LM-Studio/README.md)**: GUI Setup, GPU Offloading, and Local Server.
- **Best for**: Beginners and those who want a ChatGPT-like interface.

### 🟠 Llama.cpp / GGUF (For Developers & CPU)
The gold standard for high-performance C++ implementation.
- **[Detailed Llama.cpp Guide](./Llama-cpp/README.md)**: Building from Source, CLI Flags, and **CPU Optimization**.
- **Format**: Uses **GGUF** files, which are highly optimized.

### 🔵 OpenVINO (Intel CPU/iGPU/NPU)
Intel's official toolkit for maximizing performance on Intel hardware.
- **[Detailed OpenVINO Guide](./OpenVINO/README.md)**: Exporting models and running on iGPU/NPU.
- **Best for**: Intel laptops and servers without dedicated NVIDIA GPUs.

---

## 4. Quick Start: Ollama + Web UI

1. **Install Ollama**: Download from the official site.
2. **Pull a Model**:
   ```bash
   ollama pull mistral
   ```
3. **Run a Web UI**: Most people use [Open WebUI](https://github.com/open-webui/open-webui) (a Docker-based interface that looks like ChatGPT).
   ```bash
   docker run -d -p 3000:8080 --add-host=host.docker.internal:host-gateway -v open-webui:/app/backend/data --name open-webui ghcr.io/open-webui/open-webui:main
   ```

---

## 5. Understanding Quantization
Quantization is the process of reducing the precision of a model's weights (e.g., from 16-bit to 4-bit) to make it fit on consumer hardware with minimal loss in intelligence.
- **Q4_K_M**: The "sweet spot" for performance vs. quality.
- **Q8_0**: Near-original quality but requires double the VRAM.

---

## 🚀 Pro Tip
If you are using VS Code, use the **Continue** or **CodeGPT** extensions to connect your local Ollama instance to your editor for private, local code completion!
