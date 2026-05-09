# Quarkus

## Description
Quarkus is a Kubernetes Native Java stack tailored for OpenJDK HotSpot and GraalVM, crafted from the best-of-breed Java libraries and standards. It aims to make Java a leading platform in serverless, cloud, and Kubernetes environments.

## How it works
Traditional Java frameworks do a lot of reflection and configuration at startup, which is slow and memory-intensive. Quarkus moves most of this work to build time. It pre-boots the framework, builds a closed-world assumption, and can optionally compile down to a native binary using GraalVM, resulting in incredibly fast startup times and low memory footprints.

## How to code it
Here is a basic example of a Quarkus application:

```java
package org.acme;

import jakarta.ws.rs.GET;
import jakarta.ws.rs.Path;
import jakarta.ws.rs.Produces;
import jakarta.ws.rs.core.MediaType;

@Path("/hello")
public class GreetingResource {

    @GET
    @Produces(MediaType.TEXT_PLAIN)
    public String hello() {
        return "Hello World from Quarkus!";
    }
}
```

## Features it supports
- Supersonic Subatomic Java (extremely fast startup and low memory)
- First-class support for GraalVM native image compilation
- Live coding (zero config live reload)
- Imperative and Reactive routing combined
- Built-in Kubernetes integration

## Real projects about it
- **LogicDrop**: Migrated their massive data intelligence platform to Quarkus to reduce cloud costs.
- **Lufthansa Technik**: Uses Quarkus for their aviation platform AVIATAR.
