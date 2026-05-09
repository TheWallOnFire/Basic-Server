# Blazor

## Description
Blazor is a web framework built by Microsoft that allows developers to build interactive client-side web UI with .NET/C# instead of JavaScript.

## How it works
Blazor can run your C# code directly in the browser using WebAssembly (Blazor WebAssembly), or it can run your UI logic on the server and send UI updates to the browser over a SignalR connection (Blazor Server). This allows developers to share code and libraries between the server and the client.

## How to code it
Here is a basic example of a Blazor component (`Counter.razor`):

```razor
@page "/counter"

<h1>Counter</h1>

<p>Current count: @currentCount</p>

<button class="btn btn-primary" @onclick="IncrementCount">Click me</button>

@code {
    private int currentCount = 0;

    private void IncrementCount()
    {
        currentCount++;
    }
}
```

## Features it supports
- Single-page application (SPA) architecture using C#
- Shared logic across client and server
- Two hosting models: WebAssembly and Server
- Full access to the .NET ecosystem and standard libraries
- Component-based architecture

## Real projects about it
- **Oqtane**: A modular application framework built using Blazor.
- **Various Microsoft internal tools**: Used to quickly build dashboards and data entry apps without writing JavaScript.
