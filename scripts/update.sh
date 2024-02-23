#!/bin/bash

# スクリプトが途中で失敗した場合に終了するように設定
set -e

echo "Updating Homebrew..."
brew update
echo "Dumping current Homebrew setup to Brewfile..."
brew bundle dump --force --describe
echo "All checks passed. Proceeding with Homebrew bundle..."
brew bundle

# ホームディレクトリからのファイルコピー
echo "Copying dotfiles from home directory..."
cp -i "${HOME}/.zshrc" zshrc
cp -i "${HOME}/.zprofile" zprofile
cp -i "${HOME}/.wezterm.lua" wezterm.lua
cp -i "${HOME}/.gitconfig" gitconfig

# Neovimの設定ディレクトリをコピー
echo "Copying nvim directory from ~/.config..."
cp -r "${HOME}/.config/nvim/." nvim

# Starshipの設定ファイルをコピー
echo "Copying starship.toml from ~/.config..."
cp -i "${HOME}/.config/starship.toml" starship.toml

echo "Copy complete!"
