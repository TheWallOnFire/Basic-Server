# 08. Model Context Protocol (MCP)

The Model Context Protocol (MCP) is an open standard that enables AI models to seamlessly connect to data and tools.

## 1. Why MCP?
Before MCP, every AI integration was a custom silo. MCP provides a universal interface for AI models to access:
- **Local Data**: Files, databases, spreadsheets.
- **Remote APIs**: GitHub, Slack, Google Calendar.
- **Tools**: Running code, searching the web.

## 2. Core Components
- **MCP Host**: The application that uses the AI model (e.g., Cursor, Claude Desktop).
- **MCP Server**: The service that provides data or tools (e.g., a Postgres MCP server).
- **MCP Client**: The bridge between the host and the server.

## 3. Transport Layers
- **STDIO**: Standard input/output (for local processes).
- **SSE**: Server-Sent Events (for remote/web servers).
