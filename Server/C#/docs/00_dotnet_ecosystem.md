# 00. The .NET Ecosystem

Understanding the difference between C#, .NET, and the various "Frameworks" is crucial for any developer.

## 1. Evolution of .NET
- **.NET Framework (4.x and below)**: The original, Windows-only version of .NET. It is still supported but not recommended for new development.
- **.NET Core (1.x - 3.x)**: The first cross-platform, open-source version of .NET.
- **.NET (5, 6, 7, 8+)**: The "Unified .NET". Microsoft dropped "Core" from the name to signify that this is the future of the platform.

## 2. Key Components
- **C#**: The programming language.
- **CLR (Common Language Runtime)**: The virtual machine that runs the code (handles memory, GC, and JIT compilation).
- **BCL (Base Class Library)**: The set of standard libraries available to all .NET languages.
- **SDK (Software Development Kit)**: The tools you use to build apps (`dotnet` CLI).
- **Runtime**: The environment needed to run the apps.

## 3. How it Works (Execution Flow)
1. **Compilation**: Your C# code is compiled into **Intermediate Language (IL)**.
2. **Packaging**: The IL is stored in `.dll` or `.exe` files (Assemblies).
3. **Execution**: When the app runs, the **JIT (Just-In-Time) Compiler** in the CLR converts IL into machine code specific to the processor.

## 4. Why .NET?
- **Cross-Platform**: Run on Windows, Linux, and macOS.
- **Performance**: Consistently ranks at the top of the TechEmpower benchmarks.
- **Versatility**: Build Web, Mobile (MAUI), Desktop (WPF/WinForms), Cloud, AI (ML.NET), and Games (Unity).
- **Safety**: Strongly typed, memory-safe, and secure by design.
