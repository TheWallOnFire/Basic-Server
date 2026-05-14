# 02. Components & State Management

Building complex, interactive UIs requires a deep understanding of how components communicate and manage data.

---

## 1. Component Lifecycle
- **`OnInitializedAsync`**: Called when the component is first created. Best place for data fetching.
- **`OnParametersSetAsync`**: Called whenever the parent component updates the parameters.
- **`OnAfterRenderAsync`**: Called after the component has finished rendering. Use this for JavaScript Interop.

---

## 2. Parent-Child Communication
- **Parameters**: Pass data down from parent to child using the `[Parameter]` attribute.
- **EventCallbacks**: Pass actions up from child to parent.
```csharp
[Parameter] public EventCallback<string> OnUserChanged { get; set; }
```

---

## 3. State Management
In a large app, you need a way to share data between components that aren't parent/child.
- **Cascading Values**: Pass data down a deep component tree.
- **State Container Pattern**: Create a Singleton service that holds the application state and notifies components when it changes.
- **Fluxor**: A library for implementing the Redux pattern in Blazor.

---

## 4. JS Interop
Sometimes you still need JavaScript (e.g., for a specific UI library). Blazor allows you to call JS from C# and vice-versa using `IJSRuntime`.
```csharp
await JS.InvokeVoidAsync("alert", "Hello from C#!");
```

---

## 🚀 Pro Tip
Avoid overusing JS Interop. Try to find a C# library (like **MudBlazor** or **Blazorise**) first to keep your codebase consistent.
