# 🕵️ Agentic Researcher Project

An autonomous AI agent that takes a complex topic, searches the web, verifies sources, and synthesizes a high-quality research report.

## 🏗️ Architecture
- **Planning Agent**: Breaks the main topic into research sub-tasks.
- **Search Agent**: Uses Tavily or Google Search to find relevant articles.
- **Scraper Agent**: Extracts clean text from found URLs.
- **Synthesizer Agent**: Combines all findings into a structured Markdown report.

## 🛠️ Stack
- **Language**: Python 3.10+
- **Agent Framework**: LangGraph (for complex state) or CrewAI (for role-playing).
- **LLM**: Claude 3.5 Sonnet or GPT-4o.
- **Search API**: Tavily API.

## 🚀 Getting Started
1. Install requirements: `pip install langgraph tavily-python langchain-openai`.
2. Set up environment variables:
   ```env
   OPENAI_API_KEY=sk-...
   TAVILY_API_KEY=tvly-...
   ```
3. Run the researcher: `python main.py --topic "Future of Solid State Batteries"`.

## 🧪 Key Features
- **Self-Correction**: If the agent finds no good sources, it reformulates its search queries.
- **Parallel Research**: Multiple agents can search different aspects of the topic simultaneously.
- **Cite-while-you-write**: Automatic bibliography generation.
