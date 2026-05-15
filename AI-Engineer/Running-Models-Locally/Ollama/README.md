# 🦙 Ollama: The Easiest Way to Run Local LLMs

Ollama is a powerful, lightweight tool that allows you to run open-source large language models locally on your machine with a simple command-line interface.

---

## 📋 Requirements

### Hardware
Ollama's requirements depend entirely on the model size you want to run.
- **7B Models (e.g., Llama 3, Mistral)**: 
  - Minimum: 8GB RAM/VRAM.
  - Recommended: 16GB+ RAM or 8GB VRAM GPU.
- **13B Models**: 
  - Minimum: 16GB RAM/VRAM.
- **30B+ Models**: 
  - Minimum: 32GB RAM/VRAM.
- **70B Models**: 
  - Minimum: 64GB RAM or 2x 24GB VRAM GPUs.

### Supported Platforms
- **Windows**: Windows 10/11 (uses WSL2 or Native).
- **macOS**: Apple Silicon (M1/M2/M3) is highly recommended.
- **Linux**: Supports NVIDIA and AMD GPUs.

---

## 🚀 Getting Started

### 1. Installation
Download and install from [ollama.com](https://ollama.com/download).

### 2. Running your first model
Open your terminal and run:
```bash
ollama run llama3
```
This will automatically:
1. Download the Llama 3 model (approx 4.7GB).
2. Start an interactive chat session.

---

## 🛠️ Essential Commands

| Command | Description |
| --- | --- |
| `ollama run <model>` | Download and start a model. |
| `ollama pull <model>` | Download a model without running it. |
| `ollama list` | See all models currently on your machine. |
| `ollama rm <model>` | Delete a model to free up space. |
| `ollama serve` | Start the background server (usually runs automatically). |

---

## 🧠 Advanced: Customizing Models (Modelfiles)

You can create "custom" versions of models with your own system prompts using a `Modelfile`.

1. Create a file named `Modelfile`:
   ```dockerfile
   FROM llama3
   # Set the temperature (higher is more creative)
   PARAMETER temperature 0.7
   # Set the system message
   SYSTEM """
   You are a professional C# developer. Answer all questions with high-quality code snippets.
   """
   ```
2. Create the model:
   ```bash
   ollama create pro-coder -f Modelfile
   ```
3. Run it:
   ```bash
   ollama run pro-coder
   ```

---

## 🌐 API Access
Ollama runs a local server at `http://localhost:11434`. You can send HTTP requests to it:

```bash
curl http://localhost:11434/api/generate -d '{
  "model": "llama3",
  "prompt": "Why is the sky blue?"
}'
```

---

## 🚀 Pro Tip: Environment Variables
On Windows, you might need to set these in your System Environment Variables:
- `OLLAMA_MODELS`: Change where models are stored (useful if your C: drive is full).
- `OLLAMA_HOST`: Set to `0.0.0.0` if you want other devices on your network to access your models.
