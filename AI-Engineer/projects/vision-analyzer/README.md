# 👁️ Vision Analyzer Project

A multimodal AI application that can "see" and describe images, extract structured data from documents (OCR), and answer questions about visual scenes.

## 🏗️ Architecture
1. **Image Preprocessing**: Resize and encode images to Base64 for API transmission.
2. **Visual Reasoning**: Use GPT-4o-vision or Gemini Pro Vision to analyze the image.
3. **Structured Extraction**: Use JSON mode to extract specific fields (e.g., total price from a receipt).
4. **Scene Description**: Generate natural language summaries for accessibility.

## 🛠️ Stack
- **Language**: Python
- **Framework**: FastAPI (for the web server).
- **LLM**: GPT-4o or Gemini 1.5 Pro.
- **Frontend**: Streamlit (for quick prototyping).

## 🚀 Getting Started
1. Install requirements: `pip install fastapi pillow openai`.
2. Run the Streamlit demo: `streamlit run app.py`.
3. Upload an image and see the AI describe it in real-time.

## 🧪 Key Features
- **Object Counting**: "How many red cars are in this parking lot?"
- **Visual OCR**: Extracts text from blurry or handwritten notes.
- **Scene Analysis**: Understands complex social interactions or hazardous situations in images.
