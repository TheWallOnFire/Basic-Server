# Ruby Core Concepts for Web Development

## 1. Ruby Philosophy
Ruby was designed for developer happiness. Its creator Yukihiro "Matz" Matsumoto said: "Ruby is designed to make programmers happy." Everything in Ruby is an object, including numbers and `nil`.

## 2. Convention over Configuration (CoC)
Ruby on Rails popularized this principle: if you follow naming conventions, the framework handles wiring automatically. For example, a `User` model automatically maps to a `users` table.

## 3. Gems (Package Manager)
RubyGems is Ruby's package manager. Bundler manages gem versions:
```bash
gem install bundler       # Install Bundler
bundle init               # Create Gemfile
bundle install            # Install dependencies
```
- `Gemfile` — Lists dependencies (like `package.json`).
- `Gemfile.lock` — Locks versions.

## 4. Rack
Rack is the interface between Ruby web servers and web frameworks. Both Rails and Sinatra are built on Rack. A Rack app is simply any object that responds to `call` and returns `[status, headers, body]`.

## 5. Active Record Pattern
Rails uses Active Record, where model objects handle their own persistence:
```ruby
user = User.new(name: "Alice", email: "alice@example.com")
user.save                  # INSERT INTO users ...
user.name = "Bob"
user.save                  # UPDATE users SET ...
User.find(1)               # SELECT * FROM users WHERE id = 1
```

## 6. Rails vs. Sinatra

| Feature | Ruby on Rails | Sinatra |
| :--- | :--- | :--- |
| **Type** | Full-Stack MVC | Micro DSL |
| **Learning Curve** | Medium | Very Low |
| **Code Generation** | Yes (scaffolding) | No |
| **ORM** | Active Record (built-in) | External (Sequel, etc.) |
| **Best For** | Full web apps, startups | Small APIs, microservices |
