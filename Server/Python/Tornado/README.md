# Tornado

## Description
Tornado is a Python web framework and asynchronous networking library, originally developed at FriendFeed. By using non-blocking network I/O, Tornado can scale to tens of thousands of open connections.

## How it works
Tornado is an asynchronous framework built on a single-threaded event loop. Instead of spawning threads or processes for each request, it relies on cooperative multitasking (`async/await` in modern Python). This makes it ideal for long polling, WebSockets, and other applications that require a long-lived connection to each user.

## How to code it
Here is a basic example of a Tornado server:

```python
import tornado.ioloop
import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write("Hello, World from Tornado!")

def make_app():
    return tornado.web.Application([
        (r"/", MainHandler),
    ])

if __name__ == "__main__":
    app = make_app()
    app.listen(8888)
    print("Server running on port 8888")
    tornado.ioloop.IOLoop.current().start()
```

## Features it supports
- Built-in support for WebSockets
- Non-blocking HTTP client and server
- High concurrency with a low memory footprint
- Secure cookies and user authentication
- Built-in templating engine

## Real projects about it
- **Facebook**: Acquired FriendFeed and used Tornado in several projects.
- **Quora**: Uses Tornado heavily for their web server infrastructure.
- **Uploadcare**: Uses Tornado for its high-performance upload API.
