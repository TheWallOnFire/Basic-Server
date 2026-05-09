# Load Balancing

## Overview
Distributing incoming network traffic across multiple servers to ensure high availability and reliability.

## Load Balancer Types
- **Layer 4 (Transport)**: Routes based on IP and Port. Very fast.
- **Layer 7 (Application)**: Routes based on HTTP headers, cookies, or path. Very smart.

## Common Algorithms
- **Round Robin**: Distributes equally in order.
- **Least Connections**: Sends to the server with fewer active connections.
- **IP Hash**: Ensures a specific user always goes to the same server.
