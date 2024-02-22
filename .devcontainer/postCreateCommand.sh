#!/usr/bin/env bash
set -e
set -o noglob

# Setup fisher plugin manager for fish and install plugins
/usr/bin/fish -c "
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install edc/bass
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install PatrickF1/fzf.fish
"
echo "Fisher done" >> .vscode/postCreateCommand.log

# Create/update virtual environment
if ! (grep -q "venv /workspaces/" .venv/pyvenv.cfg || true); then
    rm -rf .venv
fi

task ansible:deps