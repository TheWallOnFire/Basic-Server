# Micronaut

## Description
Micronaut is a modern, JVM-based, full-stack framework for building modular, easily testable microservice and serverless applications. Like Quarkus, it was built specifically to overcome the performance issues of traditional frameworks like Spring in cloud-native environments.

## How it works
Micronaut avoids reflection, runtime proxies, and dynamic classloading. Instead, it uses Java Annotation Processors (Ahead-of-Time compilation) to pre-compute the dependency injection graph, AOP proxies, and configurations during the build phase. This results in fast startup times and reduced memory usage regardless of application size.

## How to code it
Here is a basic example of a Micronaut application:

```java
package example.micronaut;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.MediaType;

@Controller("/hello")
public class HelloController {

    @Get(produces = MediaType.TEXT_PLAIN)
    public String index() {
        return "Hello World from Micronaut!";
    }
}
```

## Features it supports
- Ahead-of-Time (AoT) dependency injection and AOP
- Fast startup times and low memory footprint
- Built-in support for cloud providers and serverless environments (AWS Lambda, GCP, etc.)
- Reactive HTTP client and server (Netty)
- Seamless GraalVM native image generation

## Real projects about it
- **Minecraft**: Uses Micronaut for some of its backend API services.
- **Target**: Adopts Micronaut for building microservices in retail.
