# Ruby on Rails

## Description
Ruby on Rails, or simply Rails, is a server-side web application framework written in Ruby. It is a model–view–controller (MVC) framework, providing default structures for a database, a web service, and web pages.

## How it works
Rails heavily emphasizes the principles of "Convention over Configuration" (CoC) and "Don't Repeat Yourself" (DRY). If you follow the naming conventions, Rails automatically wires up your models, views, and controllers, allowing you to build web applications incredibly fast without writing tedious configuration files.

## How to code it
Here is a basic example of a Rails controller and route:

```ruby
# config/routes.rb
Rails.application.routes.draw do
  get '/hello', to: 'greetings#hello'
end

# app/controllers/greetings_controller.rb
class GreetingsController < ApplicationController
  def hello
    render plain: 'Hello World from Ruby on Rails!'
  end
end
```

## Features it supports
- Active Record ORM
- Database migrations
- Built-in testing tools
- Asset pipeline (Sprockets/Webpacker) for compiling JS and CSS
- Action Cable for seamless WebSockets integration

## Real projects about it
- **GitHub**: Originally built and still heavily relies on Ruby on Rails.
- **Shopify**: One of the largest Ruby on Rails codebases in the world.
- **Airbnb**: Built their core platform using Rails.
