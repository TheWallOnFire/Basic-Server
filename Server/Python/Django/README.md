# Django

## Description
Django is a high-level Python web framework that encourages rapid development and clean, pragmatic design. It follows the "batteries-included" philosophy, providing almost everything developers need to build robust web applications out of the box.

## How it works
Django follows the Model-Template-Views (MTV) architectural pattern. It comes with a built-in Object-Relational Mapper (ORM) that mediates between data models (defined as Python classes) and a relational database. It intercepts requests, matches them against URL configurations, passes them to views, and renders templates.

## How to code it
Here is a very simplified example of a Django view and URL config (usually split across files):

```python
from django.http import HttpResponse
from django.urls import path

# View function
def hello_world(request):
    return HttpResponse("Hello World from Django!")

# URL routing
urlpatterns = [
    path('', hello_world),
]
```

## Features it supports
- Fully featured ORM for database abstraction
- Built-in admin interface
- Built-in authentication and authorization system
- Secure by default (protects against SQL injection, XSS, CSRF, clickjacking)
- Highly scalable and versatile
- Template engine

## Real projects about it
- **Instagram**: Built heavily on Python and Django.
- **Spotify**: Uses Django for its backend services.
- **Disqus**: Built its commenting platform using Django.
