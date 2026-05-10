# 07. AI Agents

AI Agents are systems that use an LLM as a "brain" to reason, plan, and use tools to achieve a goal autonomously.

## 1. Agent Architecture
- **Perception**: Receiving input (text, images, files).
- **Brain (LLM)**: Planning and decision making.
- **Memory**: Short-term (context window) and Long-term (RAG).
- **Action (Tools)**: Web search, code execution, API calls.

## 2. Planning Patterns
- **Plan-and-Execute**: Create a list of steps first, then do them.
- **Self-Correction**: Review the output and fix errors.
- **Reflection**: Thinking about its own thought process.

## 3. Multi-Agent Systems
Instead of one big agent, use specialized agents working together:
- **Supervisor Pattern**: One agent coordinates others.
- **Workflow Pattern**: Agents pass data to each other in a pipeline.
- **Collaboration**: Agents talk to each other to solve a task.
