#!/bin/bash
# ===========================================
# Dotfiles Setup Script for New Machine
# ===========================================
# 
# Prerequisites:
# 1. Git installed
# 2. SSH key configured for GitHub (or use HTTPS)
# 3. Run this script from your home directory
#
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/YOUR_USERNAME/dotfiles/main/setup-new-machine.sh | bash
#   OR
#   git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/dotfiles && ~/dotfiles/setup-new-machine.sh

set -e

echo "=== Dotfiles Setup Script ==="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if dotfiles already cloned
if [ ! -d "$HOME/dotfiles" ]; then
    echo -e "${YELLOW}Dotfiles not found. Please clone first:${NC}"
    echo ""
    echo "  git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/dotfiles"
    echo ""
    exit 1
fi

echo -e "${GREEN}Found dotfiles at ~/dotfiles${NC}"
echo ""

# Backup existing configs
backup_if_exists() {
    local path="$1"
    if [ -e "$path" ] && [ ! -L "$path" ]; then
        local backup="${path}.backup.$(date +%Y%m%d%H%M%S)"
        echo -e "${YELLOW}Backing up existing $path to $backup${NC}"
        mv "$path" "$backup"
    elif [ -L "$path" ]; then
        echo -e "${YELLOW}Removing existing symlink $path${NC}"
        rm "$path"
    fi
}

# Create necessary parent directories
mkdir -p "$HOME/.config"

# Backup and create symlinks
echo "=== Creating Symlinks ==="

backup_if_exists "$HOME/.config/opencode"
backup_if_exists "$HOME/.claude"
backup_if_exists "$HOME/.agents"

ln -s "$HOME/dotfiles/opencode" "$HOME/.config/opencode"
echo -e "${GREEN}Created: ~/.config/opencode -> ~/dotfiles/opencode${NC}"

ln -s "$HOME/dotfiles/claude" "$HOME/.claude"
echo -e "${GREEN}Created: ~/.claude -> ~/dotfiles/claude${NC}"

ln -s "$HOME/dotfiles/agents" "$HOME/.agents"
echo -e "${GREEN}Created: ~/.agents -> ~/dotfiles/agents${NC}"

echo ""
echo "=== Post-Setup Tasks ==="
echo ""
echo -e "${YELLOW}1. Install Claude Code plugins (run in Claude Code):${NC}"
echo "   /install-plugin anthropic-agent-skills"
echo "   /install-plugin superpowers-marketplace"
echo "   /install-plugin oh-my-claudecode"
echo ""
echo -e "${YELLOW}2. Clone travel-planner skill (if needed):${NC}"
echo "   cd ~/dotfiles/claude/skills"
echo "   git clone https://github.com/richardwang/travel-planner.git"
echo "   cd ~/dotfiles/opencode/skills"
echo "   git clone https://github.com/richardwang/travel-planner.git"
echo ""
echo -e "${GREEN}=== Setup Complete ===${NC}"
echo ""
echo "Restart your terminal and Claude Code/OpenCode to apply changes."
