# Pyramid

## Description
Pyramid is a lightweight and extensible Python web framework tailored for small, fast-paced projects that can scale. It makes it easy to write web applications by taking a "pay only for what you eat" approach.

## How it works
Pyramid sits between microframeworks like Flask and mega-frameworks like Django. It doesn't force you to use a specific templating language or database. It works by mapping URLs to code through either URL dispatch (routing) or traversal (mapping URLs to an object graph), providing massive flexibility.

## How to code it
Here is a basic example of a Pyramid server:

```python
from wsgiref.simple_server import make_server
from pyramid.config import Configurator
from pyramid.response import Response

def hello_world(request):
    return Response('Hello World from Pyramid!')

if __name__ == '__main__':
    with Configurator() as config:
        config.add_route('hello', '/')
        config.add_view(hello_world, route_name='hello')
        app = config.make_wsgi_app()
    server = make_server('0.0.0.0', 6543, app)
    server.serve_forever()
```

## Features it supports
- Extensible through add-ons
- Flexible routing via URL dispatch or Traversal
- Security and authorization built-in
- Support for multiple templating engines (Chameleon, Jinja2, Mako)
- Great for both small microservices and massive applications

## Real projects about it
- **Yelp**: Migrated legacy infrastructure to Pyramid.
- **Mozilla**: Uses Pyramid for several of their web services.
- **Substance-D**: An application framework built on top of Pyramid.
