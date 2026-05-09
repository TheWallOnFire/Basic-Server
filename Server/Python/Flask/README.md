# Flask

## Description
Flask is a lightweight WSGI web application framework for Python. It is designed to make getting started quick and easy, with the ability to scale up to complex applications. It is considered a "microframework" because it does not require particular tools or libraries.

## How it works
Flask uses Werkzeug for routing and request/response handling, and Jinja2 for templating. It handles the core of routing HTTP requests to Python functions. Because it is a microframework, it leaves the choice of database, form validation, and other extensions up to the developer, allowing for high customization.

## How to code it
Here is a basic example of a Flask server:

```python
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World from Flask!'

if __name__ == '__main__':
    app.run(debug=True, port=5000)
```

## Features it supports
- Built-in development server and fast debugger
- Integrated support for unit testing
- RESTful request dispatching
- Jinja2 templating
- Secure cookies support (client-side sessions)
- Highly extensible through a vast library of Flask plugins (Flask-SQLAlchemy, Flask-Login, etc.)

## Real projects about it
- **Pinterest**: Originally used Flask heavily for their API.
- **Twilio**: Uses Flask in their public API.
- **LinkedIn**: Deploys Flask for some of their backend services.
