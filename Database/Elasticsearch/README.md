# Elasticsearch

## Description
Elasticsearch is a distributed, RESTful search and analytics engine capable of addressing a growing number of use cases. As the heart of the Elastic Stack, it centrally stores your data for lightning fast search, fine‑tuned relevancy, and powerful analytics.

## How it works
Elasticsearch is built on Apache Lucene. It stores complex data structures that have been serialized as JSON documents. When a document is stored, it is indexed and fully searchable almost immediately. It uses an inverted index, which lists every unique word that appears in any document and identifies all of the documents each word occurs in.

## How to code it
Here is a basic example using cURL (REST API):

```bash
# Index a document
curl -X POST "localhost:9200/users/_doc/1" -H 'Content-Type: application/json' -d'
{
  "name": "Alice Wonderland",
  "bio": "Software engineer specializing in distributed systems"
}'

# Search for it
curl -X GET "localhost:9200/users/_search?q=bio:distributed"
```

## Features it supports
- Full-text search and complex querying
- Extremely fast aggregations for analytics
- Distributed architecture (highly scalable)
- Schema-free JSON documents
- Rich RESTful API

## Real projects about it
- **Wikipedia**: Uses Elasticsearch to power its global search.
- **Uber**: Uses Elasticsearch for aggregating business metrics.
- **Tinder**: Relies on it to search and match users geographically and textually.
