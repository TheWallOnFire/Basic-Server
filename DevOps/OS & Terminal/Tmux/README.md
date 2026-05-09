# Tmux (Terminal Multiplexer)

## Description
Tmux is a tool that allows you to manage multiple terminal sessions in a single window. It lets you detach from sessions and reattach to them later, even if you disconnect from the server.

## Key Use Cases
- **Persistence**: Start a long-running script on a remote server, detach, and come back hours later to see the results.
- **Multi-tasking**: Split your screen into multiple panes (e.g., code on the left, logs on the right).
- **Collaboration**: Multiple people can attach to the same session and see the same terminal.

## Essential Commands (Default Prefix: `Ctrl+b`)
- `Ctrl+b, %` : Split pane vertically.
- `Ctrl+b, "` : Split pane horizontally.
- `Ctrl+b, arrow key` : Move between panes.
- `Ctrl+b, d` : Detach from session.
- `tmux ls` : List running sessions.
- `tmux attach -t <name>` : Reattach to a session.
- `Ctrl+b, c` : Create a new window.
- `Ctrl+b, n` : Next window.

## Customization
Most users customize the prefix to `Ctrl+a` (like the older `screen` tool) and add status bar themes via `.tmux.conf`.
