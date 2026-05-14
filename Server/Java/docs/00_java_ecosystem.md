# 00. The Java Ecosystem

Java is more than just a language; it's a massive platform with a rich history of enterprise stability.

## 1. Key Terminology
- **JVM (Java Virtual Machine)**: The engine that executes Java bytecode.
- **JRE (Java Runtime Environment)**: The JVM + core libraries needed to *run* Java apps.
- **JDK (Java Development Kit)**: The JRE + tools (compiler, debugger) needed to *build* Java apps.

## 2. Java Versions & LTS
Java follows a fast-release cycle, but enterprise apps mostly stick to **Long-Term Support (LTS)** versions:
- **Java 8**: The revolutionary version (Lambdas, Streams). Still widely used.
- **Java 11**: Modularization and performance improvements.
- **Java 17**: Records, Sealed Classes, and enhanced switch expressions.
- **Java 21**: Virtual Threads (Project Loom) for massive scalability.

## 3. How it Works (Write Once, Run Anywhere)
1. **Source Code**: `.java` files.
2. **Compiler (`javac`)**: Converts `.java` into **Bytecode** (`.class` files).
3. **Execution**: The JVM loads the bytecode and uses a **JIT (Just-In-Time) Compiler** to convert it into machine-specific code at runtime.

## 4. Build Tools
The Java world relies on two main tools for dependency management and building:
- **Maven**: Convention over configuration. Uses `pom.xml`.
- **Gradle**: Flexible and powerful. Uses `build.gradle` (Groovy or Kotlin).

## 5. Why Java?
- **Stability**: Proven in massive enterprise environments for decades.
- **Ecosystem**: Millions of libraries for every possible task.
- **Tooling**: Incredible IDE support (IntelliJ, Eclipse, VS Code).
- **Scalability**: High-performance garbage collectors and modern concurrency (Virtual Threads).
