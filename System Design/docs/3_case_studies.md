# System Design Case Studies

## 1. Design a URL Shortener (e.g., Bit.ly)
- **Problem**: Shorten long URLs and redirect users.
- **Components**: Hash Generator, Database (NoSQL for write speed), Cache (Redis for popular URLs).
- **Trick**: Use base62 encoding for the short ID.

## 2. Design a Social Media Feed (e.g., Twitter/FB)
- **Problem**: Display a timeline of posts from people you follow.
- **Approach**: 
    - **Pull Model**: Compute feed on the fly (Slow).
    - **Push Model (Fan-out)**: Write post to every follower's feed cache (Fast, but bad for celebrities).
    - **Hybrid**: Push for regular users, Pull for celebrities.

## 3. Design a Rate Limiter
- **Problem**: Prevent API abuse.
- **Algorithms**: Token Bucket, Leaky Bucket, Fixed Window, Sliding Window Log.
- **Storage**: Redis is perfect due to atomic increments and TTL.

## 4. Design a Global Search (e.g., Google)
- **Problem**: Index trillions of pages and search in < 100ms.
- **Components**: Web Crawler, Inverted Index (Map words to URLs), PageRank algorithm.
- **Storage**: Highly distributed (GFS, BigTable).
