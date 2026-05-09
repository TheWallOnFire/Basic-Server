# Docker

## Description
Docker is an open-source platform designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and deploy it as one package.

## How it works
Docker uses OS-level virtualization to deliver software in packages called containers. These containers are isolated from one another and bundle their own software, libraries, and configuration files. They can communicate with each other through well-defined channels. Because they share the host system's kernel, they are much more lightweight than traditional virtual machines.

## How to code it
Here is a basic example of a `Dockerfile` for a Node.js web application:

```dockerfile
# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Define the command to run your app
CMD [ "node", "server.js" ]
```

## Features it supports
- Consistent and isolated environments
- Rapid application deployment
- Portability across any machine capable of running Docker
- Version control and component reuse
- Extensive ecosystem (Docker Hub) with ready-to-use images

## Real projects about it
- **Spotify**: Uses Docker to ensure microservices run consistently across environments.
- **PayPal**: Uses Docker to run their massive microservices architecture.
- **Yelp**: Deploys millions of containers a day to test and run their applications.
