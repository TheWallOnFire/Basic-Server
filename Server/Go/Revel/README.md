# Revel

## Description
Revel is a high-productivity, full-stack web framework for the Go language. Unlike microframeworks like Gin or Echo, Revel provides an all-inclusive approach similar to Ruby on Rails or Django, aiming to make development as rapid as possible.

## How it works
Revel uses a convention-over-configuration approach. When you create a Revel app, it sets up a predefined directory structure (MVC). It features a hot code reload mechanism where Revel itself compiles and runs your code, restarting the server on the fly when it detects changes.

## How to code it
Here is a basic example of a Revel controller:

```go
package controllers

import "github.com/revel/revel"

type App struct {
	*revel.Controller
}

func (c App) Index() revel.Result {
	greeting := "Hello World from Revel!"
	return c.Render(greeting)
}
```

## Features it supports
- Hot code reloading (no need to manually restart the server)
- Comprehensive routing capabilities
- Parameter parsing and validation
- Templating engine built-in
- Caching and job running frameworks included
- Internationalization (i18n)

## Real projects about it
- **Gophercasts**: Uses Revel for video streaming API.
- **Various internal enterprise dashboards**: Popular in environments looking for a Go alternative to Ruby on Rails.
