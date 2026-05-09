# Vitest

## Description
Vitest is a blazing-fast unit testing framework powered by Vite. It provides Jest-compatible APIs with native ESM support, TypeScript out of the box, and leverages Vite's instant HMR for extremely fast test execution.

## How to code it
```typescript
import { describe, it, expect, vi } from 'vitest';
import { sum } from './sum';

describe('sum', () => {
  it('adds two numbers', () => {
    expect(sum(1, 2)).toBe(3);
  });
});

// Mocking
vi.mock('./database');
```

## Features
- Vite-powered (instant transforms, no bundling)
- Jest-compatible API (easy migration)
- Native ESM and TypeScript support
- In-source testing (tests inside source files)
- Multi-threaded via Workers
- Built-in UI mode (`vitest --ui`)
