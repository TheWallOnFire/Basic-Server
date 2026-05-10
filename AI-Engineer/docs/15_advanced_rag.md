# 15. Advanced RAG Techniques

Moving beyond "Naive RAG" (Chunk -> Embed -> Retrieve -> Generate) to production-grade systems.

## 1. Query Transformations
Improving the initial user query to get better retrieval results.
- **Multi-Query**: Generating multiple versions of the query to capture different semantic nuances.
- **HyDE (Hypothetical Document Embeddings)**: The LLM generates a "fake" answer first, and we use that fake answer to retrieve real documents.
- **Sub-Query Decomposition**: Breaking a complex question into smaller, answerable parts.

## 2. Routing & Retrieval
- **Router**: An LLM agent that decides which data source to use (e.g., "Web Search" vs. "Internal PDF").
- **Hybrid Search**: Combining Keyword Search (BM25) with Vector Search (Cosine Similarity).
- **Metadata Filtering**: Hard-filtering results by date, category, or user ID before vector search.

## 3. Post-Processing & Re-ranking
- **Re-ranking**: Using a heavy "Cross-Encoder" model (like Cohere Rerank or BGE-Reranker) to score the top 20 results from the vector search more accurately.
- **Lost in the Middle**: LLMs often ignore information in the middle of long contexts. Advanced RAG ensures the most relevant chunks are placed at the very beginning or end of the prompt.

## 4. Agentic RAG (Self-Correction)
- **Self-RAG**: The model critiques its own retrieval and generation. If the context isn't relevant, it tries retrieving again.
- **CRAG (Corrective RAG)**: Uses a lightweight evaluator to check retrieval quality. If poor, it triggers a fallback to web search.

## 5. Long-Context Handling
As context windows grow (1M+ tokens), RAG is evolving.
- **Needle in a Haystack**: Testing the model's ability to find a specific fact in a massive context.
- **GraphRAG**: Using Knowledge Graphs alongside vector DBs to understand relationships between distant chunks.
