# 05. Embeddings & Vector Databases

To perform semantic search, we need to turn text into numbers (vectors) and store them efficiently.

## 1. What are Embeddings?
Embeddings are high-dimensional numerical representations of text where similar meanings are geographically close to each other in vector space.

## 2. Distance Metrics
How do we calculate "similarity"?
- **Cosine Similarity**: Measures the angle between vectors (most common for text).
- **Euclidean Distance (L2)**: Measures the straight-line distance.
- **Dot Product**: Combines magnitude and angle.

## 3. Vector Databases
- **Managed**: Pinecone, Weaviate, MongoDB Atlas Vector Search.
- **Open Source**: ChromaDB, Qdrant, Milvus.
- **Extensions**: pgvector (Postgres extension).
