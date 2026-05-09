# Celery

## Description
Celery is a simple, flexible, and reliable distributed system to process vast amounts of messages, while providing operations with the tools required to maintain such a system. It is the standard **Task Queue** for Python applications (Django, Flask, etc.).

## How it works
1. **Producer**: Your application adds a task to the queue.
2. **Broker**: A message broker (Redis or RabbitMQ) stores the task.
3. **Worker**: One or more Celery workers pull tasks from the broker and execute them.
4. **Result Backend**: (Optional) Stores the results of the tasks (Postgres, Redis).

## How to code it
```python
from celery import Celery

app = Celery('tasks', broker='redis://localhost:6379/0')

@app.task
def send_email(user_email):
    # Long running task
    print(f"Sending email to {user_email}")
    return True

# Call the task asynchronously
send_email.delay("user@example.com")
```

## Features
- **Asynchronous**: Run heavy tasks (emails, image processing) in the background.
- **Scheduling**: Run tasks at specific times (Celery Beat).
- **Retries**: Automatically retry failed tasks.
- **Monitoring**: Integrated with **Flower** for a visual dashboard.
- **Concurrency**: Process thousands of tasks in parallel.
