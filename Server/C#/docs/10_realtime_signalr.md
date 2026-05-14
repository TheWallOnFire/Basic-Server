# 10. Real-time SignalR

SignalR is a library for ASP.NET Core that simplifies adding real-time web functionality to apps.

## 1. What is Real-time?
The ability to have server-side code push content to connected clients instantly as it happens.

## 2. Hubs
Hubs are the high-level pipeline that allows your client and server to call methods on each other.
```csharp
public class ChatHub : Hub
{
    public async Task SendMessage(string user, string message)
    {
        await Clients.All.SendAsync("ReceiveMessage", user, message);
    }
}
```

## 3. Transport Protocols
SignalR automatically handles the best available transport:
1. **WebSockets**: The gold standard (Full duplex).
2. **Server-Sent Events (SSE)**: Unidirectional (Server to Client).
3. **Long Polling**: The fallback (Repeatedly asking for updates).

## 4. Use Cases
- **Dashboards**: Real-time stock prices or monitoring.
- **Chat Apps**: Instant messaging.
- **Gaming**: Low-latency multiplayer.
- **Notifications**: "Someone liked your photo."

## 5. Scaling SignalR
- **Backplanes**: Use Redis or Azure SignalR Service to synchronize messages across multiple server instances.
