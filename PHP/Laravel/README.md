# Laravel

## Description
Laravel is a free, open-source PHP web framework created by Taylor Otwell. It is intended for the development of web applications following the model–view–controller (MVC) architectural pattern.

## How it works
Laravel aims to make the development process a pleasing one for the developer without sacrificing application functionality. It relies on a powerful dependency injection container, an expressive ORM (Eloquent), and the Blade templating engine. It abstracts away much of the complex routing, session management, and caching.

## How to code it
Here is a basic example of a Laravel Route and Controller logic:

```php
// routes/web.php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GreetingController;

Route::get('/greeting', [GreetingController::class, 'show']);

// app/Http/Controllers/GreetingController.php
namespace App\Http\Controllers;

class GreetingController extends Controller
{
    public function show()
    {
        return view('greeting', ['name' => 'World from Laravel!']);
    }
}
```

## Features it supports
- Eloquent ORM for database interactions
- Artisan command-line interface
- Database migrations and seeders
- Built-in authentication and authorization
- Queues and background jobs

## Real projects about it
- **Twitch**: Uses parts of Laravel for its backend administration tools.
- **Disney**: Uses Laravel for some of its interactive web experiences.
- **MasterClass**: Originally built heavily on Laravel.
