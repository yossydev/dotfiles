#!/bin/bash

set -e

echo "Updating Homebrew..."
brew update
echo "Dumping current Homebrew setup to Brewfile..."
brew bundle dump --force --describe
echo "All checks passed. Proceeding with Homebrew bundle..."
brew bundle

echo "Copying dotfiles from home directory..."
cp -i "${HOME}/.zshrc" zshrc
cp -i "${HOME}/.zprofile" zprofile
cp -i "${HOME}/.wezterm.lua" wezterm.lua
cp -i "${HOME}/.gitconfig" gitconfig

echo "Copying nvim directory from ~/.config..."
cp -r "${HOME}/.config/nvim/." nvim

echo "Copying starship.toml from ~/.config..."
cp -i "${HOME}/.config/starship.toml" starship.toml

echo "Copying mise from ~/.config..."
cp -r "${HOME}/.config/mise/." mise

echo "Copying mise from ~/.config..."
cp -i "${HOME}/.config/git/ignore" global_git_ignore

echo "Copy complete!"
