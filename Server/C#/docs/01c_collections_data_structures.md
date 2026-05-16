# 01c. Collections & Data Structures

Collections are used to group multiple related objects together. C# provides a rich set of collection classes in the `System.Collections.Generic` namespace.

---

## 1. Arrays (Fixed Size)
Arrays are the most basic collection. They have a fixed size that must be defined at creation.

```csharp
string[] fruits = { "Apple", "Banana", "Orange" };
fruits[0] = "Pear"; // Access by index
Console.WriteLine(fruits.Length); // 3
```
- **Pros**: Very fast, low memory overhead.
- **Cons**: Cannot be resized. You must know the size in advance.

---

## 2. List<T> (The Dynamic Array)
The `List<T>` is the most commonly used collection in C#. It behaves like an array but resizes itself automatically.

```csharp
List<string> names = new List<string>();
names.Add("Alice");
names.Add("Bob");
names.Remove("Alice");

Console.WriteLine(names.Count); // 1
```
- **When to use**: When you need a simple ordered collection that can grow or shrink.
- **Key Methods**: `Add()`, `Remove()`, `Contains()`, `Clear()`, `Sort()`.

---

## 3. Dictionary<TKey, TValue> (Key-Value Pairs)
A Dictionary stores pairs of data. You use a "Key" to quickly find a "Value".

```csharp
Dictionary<string, int> userAges = new Dictionary<string, int>();
userAges.Add("Alice", 25);
userAges["Bob"] = 30; // Shorthand for add/update

if (userAges.TryGetValue("Alice", out int age))
{
    Console.WriteLine($"Alice is {age}");
}
```
- **When to use**: When you need fast lookups based on a unique identifier (like an ID or Name).
- **Note**: Keys must be unique.

---

## 4. HashSet<T> (Unique Sets)
A `HashSet` is an unordered collection of unique elements. It is optimized for high-performance set operations.

```csharp
HashSet<int> uniqueIds = new HashSet<int> { 1, 2, 2, 3 }; // The second '2' is ignored
uniqueIds.Add(4);

Console.WriteLine(uniqueIds.Count); // 4
```
- **When to use**: When you need to ensure no duplicates exist or when you need to perform math-like set operations (Union, Intersect).

---

## 5. Queue<T> & Stack<T>
These are specialized collections for specific data flows.

### Queue<T> (FIFO - First In, First Out)
Think of a line at a grocery store.
```csharp
Queue<string> messages = new Queue<string>();
messages.Enqueue("Message 1");
string first = messages.Dequeue(); // "Message 1"
```

### Stack<T> (LIFO - Last In, First Out)
Think of a stack of plates.
```csharp
Stack<string> undoHistory = new Stack<string>();
undoHistory.Push("Action 1");
string lastAction = undoHistory.Pop(); // "Action 1"
```

---

## 🚀 Performance Comparison

| Collection | Lookup (by Index) | Lookup (by Key/Value) | Insert/Delete |
| :--- | :--- | :--- | :--- |
| **Array** | O(1) | O(n) | N/A (Fixed size) |
| **List<T>** | O(1) | O(n) | O(n) |
| **Dictionary<TKey, TValue>** | N/A | **O(1)** | **O(1)** |
| **HashSet<T>** | N/A | **O(1)** | **O(1)** |

> [!TIP]
> Always use the **Generic** versions (`List<T>`, `Dictionary<K,V>`) found in `System.Collections.Generic`. Avoid the old non-generic versions like `ArrayList`, as they cause "Boxing" and degrade performance.
