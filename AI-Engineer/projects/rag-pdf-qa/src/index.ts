import { OpenAIEmbeddings } from "@langchain/openai";
import { PineconeStore } from "@langchain/pinecone";
import { Pinecone } from "@pinecone-database/pinecone";
import { ChatOpenAI } from "@langchain/openai";
import { createRetrievalChain } from "langchain/chains/retrieval";
import { createStuffDocumentsChain } from "langchain/chains/combine_documents";
import { ChatPromptTemplate } from "@langchain/core/prompts";
import * as dotenv from "dotenv";

dotenv.config();

async function main() {
  const pc = new Pinecone();
  const index = pc.Index(process.env.PINECONE_INDEX!);

  const vectorStore = await PineconeStore.fromExistingIndex(
    new OpenAIEmbeddings(),
    { pineconeIndex: index }
  );

  const model = new ChatOpenAI({ modelName: "gpt-4o" });

  const systemPrompt = `You are an assistant for question-answering tasks. 
  Use the following pieces of retrieved context to answer the question. 
  If you don't know the answer, just say that you don't know. 
  Use three sentences maximum and keep the answer concise.\n\n{context}`;

  const prompt = ChatPromptTemplate.fromMessages([
    ["system", systemPrompt],
    ["human", "{input}"],
  ]);

  const questionAnswerChain = await createStuffDocumentsChain({ llm: model, prompt });
  const ragChain = await createRetrievalChain({
    retriever: vectorStore.asRetriever(),
    combineDocsChain: questionAnswerChain,
  });

  const response = await ragChain.invoke({
    input: "What is the main topic of the document?",
  });

  console.log(response.answer);
}

main();
