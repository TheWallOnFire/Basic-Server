# 08. Real-time SignalR

SignalR makes it incredibly easy to add real-time, two-way communication to your web applications.

---

## 1. How it Works (Transports)
SignalR automatically chooses the best available connection:
1. **WebSockets**: The best option (Full duplex).
2. **Server-Sent Events**: If WebSockets aren't available.
3. **Long Polling**: The ultimate fallback.

---

## 2. Hubs
The **Hub** is the high-level API that allows your server and client to call methods on each other.
```csharp
public class ChatHub : Hub
{
    public async Task SendMessage(string user, string message)
    {
        await Clients.All.SendAsync("ReceiveMessage", user, message);
    }
}
```

---

## 3. Scaling SignalR
Because SignalR keeps connections open, you need a way to send messages between multiple server nodes.
- **Redis Backplane**: Messages are sent to Redis, which then pushes them to all other server nodes.
- **Azure SignalR Service**: A fully managed service that handles the thousands of persistent connections for you.

---

## 4. Use Cases
- **Real-time Dashboards**: Stock prices or server monitoring.
- **Collaboration**: Multiple people editing the same document (like Google Docs).
- **Notifications**: "New message received" or "Order shipped."
- **Gaming**: Low-latency multiplayer updates.

---

## 🚀 Pro Tip
Always use **Strongly Typed Hubs**. By using an interface for your client methods, you prevent "Magic String" errors and get full IntelliSense support.
