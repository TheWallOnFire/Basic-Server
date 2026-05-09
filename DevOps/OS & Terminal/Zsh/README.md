# Zsh & Oh My Zsh

## Description
**Zsh** is a powerful shell that builds on top of Bash. **Oh My Zsh** is an open-source, community-driven framework for managing your Zsh configuration.

## Why use Zsh?
- **Autocompletion**: Smarter and faster than Bash.
- **Plugins**: Over 300+ plugins (Git, Docker, K8s, Node).
- **Themes**: 150+ themes (like Agnoster or Powerlevel10k) that show Git branch, status, and exit codes in the prompt.
- **Alias Management**: Easily manage command shortcuts.

## Essential Plugins
- **git**: Shows the current branch and status in your prompt.
- **zsh-autosuggestions**: Suggests commands as you type based on history.
- **zsh-syntax-highlighting**: Colors commands in green (valid) or red (invalid) as you type.
- **docker / kubectl**: Tab-completion for complex commands.

## How to install
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## .zshrc Config Example
```bash
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker kubectl)
ZSH_THEME="robbyrussell"
source $ZSH_HOME/oh-my-zsh.sh
```
