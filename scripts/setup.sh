#!/bin/bash

# Homebrewのインストール
echo "Installing Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Brewfileからパッケージのインストール
echo "Installing packages from Brewfile..."
brew update
brew upgrade --all
brew doctor
brew -v
brew bundle

# 各種dotfilesをホームディレクトリにコピー
echo "Copying dotfiles to home directory..."
cp .zshrc ~/
cp .wezterm.lua ~/
cp .gitconfig ~/

# Neovimの設定ディレクトリをコピー
echo "Copying nvim directory to ~/.config..."
cp -r nvim ~/.config/

# Starshipの設定ファイルをコピー
echo "Copying starship.toml to ~/.config..."
cp starship.toml ~/.config/

echo "Installation complete!"
