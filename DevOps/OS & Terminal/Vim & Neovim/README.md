# Vim & Neovim

## Description
Vim (Vi IMproved) is a highly configurable text editor built to make creating and changing any kind of text very efficient. It is included by default in almost every Linux/Unix system. Neovim is a modern fork of Vim with better performance and plugin support (Lua).

## Why learn Vim?
- **Server Editing**: When you SSH into a server, Vim is often the only editor available.
- **Speed**: Once you learn the keybindings, you can edit text much faster than with a mouse.
- **Ubiquity**: It works everywhere.

## Basic Commands (The "Escape" Key is your friend)
- `i` : Insert mode (start typing).
- `Esc` : Return to Normal mode.
- `:w` : Save (write).
- `:q` : Quit.
- `:wq` or `:x` : Save and Quit.
- `:q!` : Quit without saving.
- `/pattern` : Search for pattern.
- `dd` : Delete (cut) current line.
- `yy` : Copy (yank) current line.
- `p` : Paste after cursor.

## Neovim (Modern Era)
- Uses **Lua** for configuration (much faster than VimScript).
- **LSP (Language Server Protocol)**: Brings IDE-like features (autocompletion, go-to-definition) to the terminal.
- **Treesitter**: High-performance syntax highlighting.
- Popular distros: **LazyVim**, **LunarVim**, **NVChad**.
