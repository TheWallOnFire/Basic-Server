# 📚 RAG PDF-QA Project

A professional-grade RAG (Retrieval-Augmented Generation) system that allows users to upload PDF documents and ask questions about their content.

## 🏗️ Architecture
1. **Ingestion**: Extract text from PDFs using `pdf-parse`.
2. **Chunking**: Split text into overlapping segments using LangChain's `RecursiveCharacterTextSplitter`.
3. **Embedding**: Convert chunks into vector embeddings using OpenAI's `text-embedding-3-small`.
4. **Storage**: Store vectors in a high-performance database (Pinecone, Chroma, or Weaviate).
5. **Retrieval**: Perform semantic search to find the most relevant chunks for a user query.
6. **Generation**: Pass chunks to an LLM (GPT-4o) to generate a grounded answer.

## 🛠️ Stack
- **Runtime**: Node.js / TypeScript
- **Framework**: LangChain
- **Vector DB**: Pinecone (Cloud) or Chroma (Local)
- **API**: Express.js or Fastify

## 🚀 Getting Started
1. Clone the repo.
2. Install dependencies: `npm install`.
3. Set up environment variables in `.env`:
   ```env
   OPENAI_API_KEY=your_key
   PINECONE_API_KEY=your_key
   ```
4. Run the ingestion script: `npm run ingest`.
5. Start the chat API: `npm run dev`.

## 🧪 Key Features
- **Semantic Search**: Understands context beyond keywords.
- **Source Attribution**: Tells the user exactly which page and document the answer came from.
- **Chat History**: Remembers the context of the conversation.
