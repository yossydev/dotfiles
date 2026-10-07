#!/bin/bash

set -e

echo "Updating Homebrew..."
brew update
echo "Dumping current Homebrew setup to Brewfile..."
brew bundle dump --force
echo "All checks passed. Proceeding with Homebrew bundle..."
brew bundle

echo "Copying dotfiles from home directory..."
cp -i "${HOME}/.zshrc" zshrc
cp -i "${HOME}/.zshenv" zshenv
cp -i "${HOME}/.zprofile" zprofile
cp -i "${HOME}/.wezterm.lua" wezterm.lua
cp -i "${HOME}/.gitconfig" gitconfig
cp -i "${HOME}/.gitignore_global" gitignore_global

echo "Copying nvim directory from ~/.config..."
rsync -av --exclude='.git' --exclude='.cache' "${HOME}/.config/nvim/" nvim

echo "Copying starship.toml from ~/.config..."
cp -i "${HOME}/.config/starship.toml" starship.toml

echo "Copying mise from ~/.config..."
cp -r "${HOME}/.config/mise/." mise

echo "Installing tools with mise..."
mise trust mise/config.toml
mise install

# ~/.codex/config.toml is mostly generated project state. The repo copy is the portable subset.
# Do not copy ~/.npmrc or ~/.cursor/mcp.json; they contain tokens.
echo "Copying app configs..."
mkdir -p gh zed claude cursor ghostty codex
cp -i "${HOME}/.config/gh/config.yml" gh/config.yml
cp -i "${HOME}/.config/zed/settings.json" zed/settings.json
cp -i "${HOME}/.claude/settings.json" claude/settings.json
cp -i "${HOME}/Library/Application Support/com.mitchellh.ghostty/config" ghostty/config
cp -i "${HOME}/Library/Application Support/Cursor/User/settings.json" cursor/settings.json
cp -i "${HOME}/Library/Application Support/Cursor/User/keybindings.json" cursor/keybindings.json

echo "Copy complete!"
