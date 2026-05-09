# Symfony

## Description
Symfony is a PHP web application framework and a set of reusable PHP components. It aims to speed up the creation and maintenance of web applications and to replace repetitive coding tasks.

## How it works
Symfony is heavily decoupled, meaning developers can use its components standalone without using the full framework. When used as a full-stack framework, it relies heavily on configuration files (YAML, XML, or Attributes) and a robust Dependency Injection container to manage services and components.

## How to code it
Here is a basic example of a Symfony controller:

```php
namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController
{
    #[Route('/hello')]
    public function index(): Response
    {
        return new Response('Hello World from Symfony!');
    }
}
```

## Features it supports
- Reusable components (many other frameworks like Laravel use Symfony components)
- Highly configurable and extensible
- Doctrine ORM integration
- Twig templating engine
- Robust profiler and debugging tools

## Real projects about it
- **Spotify**: Uses Symfony components to handle millions of user requests.
- **Drupal**: Since version 8, Drupal is built on top of Symfony components.
- **PrestaShop**: E-commerce platform built heavily on Symfony.
