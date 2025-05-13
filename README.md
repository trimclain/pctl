# `pctl` - Manage Your Projects

## Requirements
- fzf
- tmux

## Installation
```
curl -fsSL https://raw.githubusercontent.com/trimclain/pctl/main/install.sh | bash
```

## Usage

From `pctl help`:

```
Usage:
  pctl [command]

COMMANDS:
  h, help               Show this help message
  v, version            Print pctl version
  s, status             Show the status of all projects
  p, pull               Pull updates in all projects
  g, get                Clone a project from github
  a, add [owner]        Add current project to the list (optional: pass github repo owner)
  o, open [project]     Open a project in a new tmux session (optional: pass project name)
```
