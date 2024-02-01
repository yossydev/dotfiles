#!/bin/bash

# スクリプトが途中で失敗した場合に終了するように設定
set -e

# ファイル作成
touch "${HOME}/.zshrc"
touch "${HOME}/.zprofile"
touch "${HOME}/.wezterm.lua"
touch "${HOME}/.gitconfig"
mkdir -p "${HOME}/.config/nvim"
mkdir -p "${HOME}/.config"

# 各種dotfilesをホームディレクトリにコピー
echo "Copying dotfiles to home directory..."
cp -i zshrc "${HOME}/.zshrc"
cp -i zprofile "${HOME}/.zprofile"
cp -i wezterm.lua "${HOME}/.wezterm.lua"
cp -i gitconfig "${HOME}/.gitconfig"

# Neovimの設定ディレクトリをコピー
echo "Copying nvim directory to ~/.config..."
cp -r nvim "${HOME}/.config/"

# Starshipの設定ファイルをコピー
echo "Copying starship.toml to ~/.config..."
cp -i starship.toml "${HOME}/.config/"

# Homebrewのインストール
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Homebrewの環境変数を.zprofileに追加
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

# Brewfileからパッケージのインストール
echo "Installing packages from Brewfile..."
brew update
brew upgrade
brew doctor
brew -v
brew bundle

echo "Installation complete!"
