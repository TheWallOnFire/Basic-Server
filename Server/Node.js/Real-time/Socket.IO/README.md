# Socket.IO

## Description
Socket.IO is the most popular real-time communication library for Node.js. It enables bidirectional, event-based communication between clients and servers using WebSockets with automatic fallback to HTTP long-polling.

## How to code it
```javascript
// Server
const { Server } = require('socket.io');
const io = new Server(httpServer, {
  cors: { origin: 'http://localhost:3000' }
});

io.on('connection', (socket) => {
  console.log('User connected:', socket.id);

  // Listen for events
  socket.on('chat:message', (data) => {
    io.emit('chat:message', data);          // Broadcast to all
  });

  // Rooms
  socket.on('join:room', (roomId) => {
    socket.join(roomId);
    io.to(roomId).emit('user:joined', socket.id);
  });

  socket.on('disconnect', () => {
    console.log('User disconnected:', socket.id);
  });
});

// Client
import { io } from 'socket.io-client';
const socket = io('http://localhost:4000');

socket.emit('chat:message', { text: 'Hello!' });
socket.on('chat:message', (data) => console.log(data));
```

## Features
- Automatic reconnection and fallback (WebSocket → HTTP polling)
- Room and namespace support
- Binary streaming (files, images)
- Acknowledgements (request-response pattern)
- Middleware for authentication
- Redis adapter for horizontal scaling across multiple servers
