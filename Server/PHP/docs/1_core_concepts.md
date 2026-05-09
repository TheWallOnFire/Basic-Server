# PHP Core Concepts for Web Development

## 1. How PHP Works
PHP is a server-side scripting language embedded in HTML. When a browser requests a PHP page, the web server (Apache/Nginx) passes it to the PHP interpreter, which processes the code and returns plain HTML to the browser.

## 2. Composer (Dependency Manager)
Composer is PHP's package manager (like npm for Node.js):
```bash
composer init                    # Initialize a project
composer require vendor/package  # Install a package
composer install                 # Install from composer.json
```
- `composer.json` — Manifest file.
- `composer.lock` — Locks exact versions.

## 3. PSR Standards
PHP-FIG (Framework Interoperability Group) defines coding standards:
- **PSR-4**: Autoloading standard (maps namespaces to directories).
- **PSR-7**: HTTP message interfaces.
- **PSR-12**: Extended coding style guide.

## 4. MVC in PHP
Both Laravel and Symfony follow the MVC pattern:
- **Model**: Eloquent (Laravel) or Doctrine (Symfony).
- **View**: Blade (Laravel) or Twig (Symfony).
- **Controller**: Handles request logic.

## 5. Artisan & Console Commands
Laravel's CLI tool for rapid development:
```bash
php artisan make:model User -m    # Create model + migration
php artisan migrate               # Run database migrations
php artisan serve                 # Start local dev server
```

## 6. Laravel vs. Symfony

| Feature | Laravel | Symfony |
| :--- | :--- | :--- |
| **Philosophy** | Developer happiness | Enterprise flexibility |
| **ORM** | Eloquent (Active Record) | Doctrine (Data Mapper) |
| **Template** | Blade | Twig |
| **Learning Curve** | Low | Medium-High |
| **Best For** | Rapid development, startups | Enterprise, long-term projects |
