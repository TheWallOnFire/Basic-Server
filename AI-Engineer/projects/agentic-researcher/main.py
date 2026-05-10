import os
from dotenv import load_dotenv
from langgraph.graph import StateGraph, END
from typing import TypedDict, List
from langchain_openai import ChatOpenAI
from langchain_community.tools.tavily_search import TavilySearchResults

load_dotenv()

class AgentState(TypedDict):
    topic: str
    research_notes: List[str]
    report: str

def search_step(state: AgentState):
    search = TavilySearchResults(max_results=3)
    results = search.run(state['topic'])
    return {"research_notes": [str(results)]}

def synthesize_step(state: AgentState):
    llm = ChatOpenAI(model="gpt-4o")
    prompt = f"Synthesize a report on {state['topic']} based on these notes: {state['research_notes']}"
    response = llm.invoke(prompt)
    return {"report": response.content}

# Define Graph
workflow = StateGraph(AgentState)
workflow.add_node("search", search_step)
workflow.add_node("synthesize", synthesize_step)

workflow.set_entry_point("search")
workflow.add_edge("search", "synthesize")
workflow.add_edge("synthesize", END)

app = workflow.compile()

if __name__ == "__main__":
    result = app.invoke({"topic": "Future of AI Agents in 2026"})
    print(result['report'])
