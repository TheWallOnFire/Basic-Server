# NestJS

## Description
NestJS is a progressive Node.js framework for building efficient, reliable, and scalable server-side applications. It uses TypeScript by default and is heavily inspired by Angular's architecture (modules, decorators, dependency injection).

## How it works
NestJS organizes code into Modules, Controllers, and Providers (Services). It uses decorators to define routes, inject dependencies, and apply middleware. Under the hood, it can use Express or Fastify as the HTTP engine.

## How to code it
```typescript
// app.controller.ts
import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Get()
  findAll() {
    return this.usersService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.usersService.findOne(+id);
  }

  @Post()
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }
}
```

## Features it supports
- TypeScript-first with full decorator support
- Built-in dependency injection
- Modular architecture (easy to scale large codebases)
- Guards, Interceptors, Pipes, and Filters
- WebSocket support, GraphQL, Microservices
- Swagger/OpenAPI auto-generation
- Built-in testing utilities

## Real projects about it
- **Adidas**: Uses NestJS for backend microservices.
- **Roche**: Uses NestJS in healthcare data platforms.
- **Capgemini**: Enterprise backend solutions.
