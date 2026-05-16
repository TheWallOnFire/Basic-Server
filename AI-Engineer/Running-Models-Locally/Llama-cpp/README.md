# 🛠️ Llama.cpp: High-Performance LLM Inference

`llama.cpp` is the gold standard for running LLMs on consumer hardware. Written in plain C/C++, it is highly optimized for performance and is the backend that powers almost every other local LLM tool (including Ollama and LM Studio).

---

## 🏗️ Why use Llama.cpp directly?
- **Maximum Performance**: Minimal overhead compared to GUI tools.
- **Customization**: Full control over every inference parameter.
- **Portability**: Runs on everything from a Raspberry Pi to a high-end server.
- **GGUF Format**: The creator of the highly efficient GGUF file format.

---

## 🚀 Getting Started (Windows/Linux)

### 1. Build from Source
To get the best performance for your specific hardware:

```bash
git clone https://github.com/ggerganov/llama.cpp
cd llama.cpp

# OPTION A: CPU Only (Intel/AMD with AVX2)
cmake -B build
cmake --build build --config Release

# OPTION B: NVIDIA GPU (CUDA)
cmake -B build -DGGML_CUDA=ON
cmake --build build --config Release

# OPTION C: Intel GPU (SYCL)
cmake -B build -DGGML_SYCL=ON
cmake --build build --config Release
```

---

## 💻 CPU Optimization (The "Secret Sauce")
Running models on a CPU is slower than a GPU, but `llama.cpp` makes it surprisingly viable through advanced instruction sets.

### 1. Match Threads to Physical Cores
Do **not** use hyperthreading (logical cores). If your CPU has 8 physical cores and 16 threads, use `-t 8`.
```bash
./llama-cli -m model.gguf -p "Prompt" -t 8
```

### 2. Memory Bandwidth is King
CPU inference speed is limited by how fast data moves from your RAM to the CPU. 
- **Dual-channel RAM** is a must.
- Faster RAM (DDR5 vs DDR4) results in a direct performance boost.

### 3. Instruction Sets
`llama.cpp` automatically detects and uses:
- **AVX / AVX2 / AVX-512**: For Intel and AMD.
- **AMX (Advanced Matrix Extensions)**: High-speed matrix math on modern Intel CPUs (Xeon/Core Ultra).
- **ARM_NEON**: For Apple Silicon and Raspberry Pi.

### 2. Download a Model
Download a `.gguf` file from Hugging Face (e.g., [Bartowski's Llama-3-8B-GGUF](https://huggingface.co/bartowski/Meta-Llama-3-8B-Instruct-GGUF)).

### 3. Run Inference
```bash
./build/bin/llama-cli -m models/llama-3-8b.gguf -p "The meaning of life is" -n 128
```

---

## 🛠️ Key Flags for Performance

| Flag | Description |
| --- | --- |
| `-ngl <N>` | **Number of layers to offload to GPU**. Set to 99 to offload everything. |
| `-t <N>` | **Threads**. Usually should match your physical CPU core count. |
| `-c <N>` | **Context Size**. Default is 512, increase to 4096 or 8192 for longer chats. |
| `--temp <N>` | **Temperature**. `0.7` is standard, `0.0` for deterministic answers. |

---

## 🐍 Python Bindings (`llama-cpp-python`)
If you want to build your own AI application in Python, use the official bindings:

```bash
pip install llama-cpp-python
```

```python
from llama_cpp import Llama

llm = Llama(model_path="./models/llama-3-8b.gguf", n_gpu_layers=-1)
output = llm("Q: Name the planets in our solar system? A: ", max_tokens=32, stop=["Q:", "\n"])
print(output)
```

---

## 🚀 Pro Tip
Use the **`llama-server`** binary to host your own API server. It is extremely fast and includes a simple built-in web interface for testing.
