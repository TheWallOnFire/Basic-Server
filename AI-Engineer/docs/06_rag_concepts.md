# 06. RAG Concepts

Retrieval Augmented Generation (RAG) is the gold standard for connecting LLMs to private data.

## 1. The RAG Lifecycle
1. **Load**: Importing documents (PDFs, Markdown, Databases).
2. **Chunk**: Breaking long text into smaller pieces (preserving context).
3. **Embed**: Converting chunks into vectors.
4. **Store**: Saving vectors in a Vector DB.
5. **Retrieve**: Finding the most relevant chunks for a user query.
6. **Augment**: Injecting those chunks into the prompt.
7. **Generate**: The LLM answers based on the provided context.

## 2. Advanced RAG
- **Hybrid Search**: Combining keyword search (BM25) with semantic search.
- **Re-ranking**: Using a second, more powerful model to rank retrieved results.
- **Query Expansion**: Rewriting the user's query to improve retrieval.
- **Parent-Child Retrieval**: Indexing small chunks but retrieving larger parent context.

## 3. Frameworks
- **LangChain**: The most popular framework for chain-based AI apps.
- **LlamaIndex**: Specifically optimized for data retrieval and RAG.
