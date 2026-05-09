# Sinatra

## Description
Sinatra is a free and open-source software web application library and domain-specific language written in Ruby. It is an alternative to other Ruby web application frameworks such as Ruby on Rails, but is much smaller and lighter.

## How it works
Unlike Rails, Sinatra does not follow the typical MVC pattern by default. It is a microframework that allows developers to quickly create web applications with minimal effort by directly mapping HTTP methods and URLs to blocks of Ruby code.

## How to code it
Here is a basic example of a Sinatra server:

```ruby
require 'sinatra'

get '/hello' do
  'Hello World from Sinatra!'
end

# Run with: ruby app.rb
```

## Features it supports
- Extremely lightweight and fast
- Simple routing DSL
- Rack compatible
- Support for numerous templating engines (ERB, Haml, Sass, etc.)
- Ideal for small APIs and microservices

## Real projects about it
- **Apple**: Uses Sinatra for some internal tooling.
- **BBC**: Uses Sinatra for some of its broadcasting APIs.
- **Stripe**: Relies on Sinatra for parts of its massive payment infrastructure API.
