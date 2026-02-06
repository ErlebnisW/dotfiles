# Dotfiles

Configuration sync for **OpenCode** and **Claude Code** across multiple machines.

## What's Included

```
dotfiles/
├── opencode/           # OpenCode configuration
│   ├── AGENTS.md       # Agent instructions
│   ├── opencode.json   # Main config
│   ├── skills/         # Custom skills (paper-track, brainstorm, pinescript, etc.)
│   └── deep-research/  # Deep research skill
│
├── claude/             # Claude Code configuration
│   ├── settings.json   # Main settings
│   ├── CLAUDE.md       # Project instructions
│   ├── agents/         # Agent definitions
│   ├── hooks/          # Custom hooks
│   ├── skills/         # Custom skills
│   └── commands/       # Custom commands
│
├── agents/             # Shared skills
│   └── skills/         # Vercel best practices, etc.
│
└── setup-new-machine.sh  # Setup script for new machines
```

## Quick Start

### First Machine (Already Done)

The dotfiles are already set up with symlinks:
- `~/.config/opencode` → `~/dotfiles/opencode`
- `~/.claude` → `~/dotfiles/claude`
- `~/.agents` → `~/dotfiles/agents`

### New Machine Setup

```bash
# 1. Clone this repo
git clone git@github.com:ErlebnisW/dotfiles.git ~/dotfiles

# 2. Run setup script
~/dotfiles/setup-new-machine.sh

# 3. Install Claude Code plugins (in Claude Code terminal)
/install-plugin anthropic-agent-skills
/install-plugin oh-my-claudecode
/install-plugin superpowers-marketplace
```

## Daily Sync

### After Making Changes

```bash
cd ~/dotfiles
git add .
git commit -m "Update: describe your changes"
git push
```

### On Other Machines

```bash
cd ~/dotfiles
git pull
```

Changes take effect immediately (symlinks point to the repo).

## What's NOT Synced

These are machine-specific and excluded via `.gitignore`:

- `claude/history.jsonl` - Command history
- `claude/projects/` - Project-specific settings
- `claude/cache/`, `claude/debug/` - Temporary files
- `claude/tasks/`, `claude/todos/`, `claude/transcripts/` - Session data
- `claude/plugins/marketplaces/` - Installed separately per machine
- `opencode/.history/` - Session history

## Custom Skills

| Skill | Description |
|-------|-------------|
| `paper-track` | Academic paper tracking and analysis |
| `brainstorm` | Research idea brainstorming |
| `pinescript-strategist` | TradingView strategy analysis |
| `deep-research` | Multi-agent deep research workflow |
| `travel-planner` | Multi-agent travel planning |

## Troubleshooting

### Symlink Issues

If symlinks break, re-run the setup script:
```bash
~/dotfiles/setup-new-machine.sh
```

### Plugin Issues

Plugins are installed per-machine. If missing, reinstall in Claude Code:
```
/install-plugin <plugin-name>
```

### Merge Conflicts

If you edited config on both machines:
```bash
git pull --rebase
# Resolve conflicts if any
git push
```
