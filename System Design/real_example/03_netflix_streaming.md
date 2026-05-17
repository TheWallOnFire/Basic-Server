# Designing a Video Streaming Service (Netflix/YouTube)

A system capable of storing massive video files, processing them for different devices, and streaming them globally without buffering.

---

## 1. Requirements

### Functional
- Upload videos.
- Stream videos smoothly across various devices (Mobile, 4K TV, Web).
- Record viewing history and metrics.

### Non-Functional
- **High Availability**: Streaming must not go down.
- **Low Latency**: Video should start playing instantly.
- **Massive Bandwidth**: Must support petabytes of outbound traffic daily.

---

## 2. The Core Challenge: Bandwidth & Location
You cannot stream a 4K movie to a user in Tokyo from a single server in New York without massive buffering and latency. The internet pipeline isn't fast enough, and the physical distance is too great.

### The Solution: CDNs (Content Delivery Networks)
A CDN is a network of geographically distributed servers.
- Netflix places "Open Connect" servers directly inside the data centers of local Internet Service Providers (ISPs) worldwide.
- When you press play in Tokyo, you aren't streaming from California; you are streaming from a server located just a few miles from your house.

---

## 3. High-Level Architecture

### Part A: The Control Plane (Metadata & UIs)
This is the standard microservices architecture (hosted on AWS for Netflix).
- Handles user login, billing, movie searches, and the recommendation engine.
- Stores metadata (Title, Actors, Release Date) in a fast relational or NoSQL database.
- *Traffic*: High Request Rate, Low Data Transfer (just JSON text).

### Part B: The Data Plane (Video Streaming)
This is the heavy lifting part (handled by Netflix's custom Open Connect CDN).
- Handles the actual delivery of massive video files.
- *Traffic*: Lower Request Rate, Massive Data Transfer (Gigabytes per second).

---

## 4. Video Processing (Transcoding)
When a raw video is uploaded, it cannot be streamed directly. It must be processed into multiple formats.

### Why Transcode?
1. **Device Compatibility**: An iPhone uses different video codecs than a Samsung TV.
2. **Network Speeds**: A user on 5G needs a 4K file. A user on 3G needs a 360p file.

### The Pipeline
1. **Upload**: Raw video is uploaded to Blob Storage (e.g., AWS S3).
2. **Message Queue**: A message is sent to a queue (e.g., Kafka or RabbitMQ) triggering the encoding process.
3. **Chunking**: The video is split into smaller 5-second chunks.
4. **Parallel Encoding**: Hundreds of worker servers process these chunks simultaneously into different resolutions (1080p, 720p, 360p) and different codecs.
5. **Distribution**: The finished files are pushed to the global CDN nodes.

---

## 5. Adaptive Bitrate Streaming (Client-Side Logic)
How does Netflix prevent buffering if your Wi-Fi suddenly drops?
- The video is stored on the CDN as hundreds of small 5-second chunks in various qualities.
- The **Video Player** (client) monitors your internet speed in real-time.
- If speed drops, the player seamlessly requests the next 5-second chunk in 480p instead of 4K. When speed recovers, it requests the next chunk in 4K again.

---

## 6. Popularity & Storage Optimization
It's too expensive to store *every* movie on *every* local CDN server worldwide.
- **Hot Content**: A new popular release (e.g., Stranger Things) is proactively pushed to every local edge server globally.
- **Cold Content**: An obscure 1980s documentary might only be stored in a central, regional hub. If someone requests it, it takes slightly longer to start as it is pulled from the central hub to the local CDN edge.
