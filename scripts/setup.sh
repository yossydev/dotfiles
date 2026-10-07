#!/bin/bash
set -e

mkdir -p "${HOME}/.config/nvim"
mkdir -p "${HOME}/.config/mise"
mkdir -p "${HOME}/.config/git"
mkdir -p "${HOME}/.config/gh"
mkdir -p "${HOME}/.config/zed"
mkdir -p "${HOME}/.claude"
mkdir -p "${HOME}/.codex"
mkdir -p "${HOME}/Library/Application Support/Cursor/User"
mkdir -p "${HOME}/Library/Application Support/com.mitchellh.ghostty"

echo "Copying dotfiles to home directory..."
cp zshrc "${HOME}/.zshrc"
cp zshenv "${HOME}/.zshenv"
cp zprofile "${HOME}/.zprofile"
cp wezterm.lua "${HOME}/.wezterm.lua"
cp gitconfig "${HOME}/.gitconfig"
cp gitignore_global "${HOME}/.gitignore_global"

echo "Copying nvim directory to ~/.config..."
cp -r nvim "${HOME}/.config/"

echo "Copying starship.toml to ~/.config..."
cp starship.toml "${HOME}/.config/starship.toml"

echo "Copying mise directory to ~/.config..."
cp -r mise "${HOME}/.config/"

echo "Copying app configs..."
cp gh/config.yml "${HOME}/.config/gh/config.yml"
cp zed/settings.json "${HOME}/.config/zed/settings.json"
cp claude/settings.json "${HOME}/.claude/settings.json"
cp codex/config.toml "${HOME}/.codex/config.toml"
cp ghostty/config "${HOME}/Library/Application Support/com.mitchellh.ghostty/config"
cp cursor/settings.json "${HOME}/Library/Application Support/Cursor/User/settings.json"
cp cursor/keybindings.json "${HOME}/Library/Application Support/Cursor/User/keybindings.json"

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Evaluating Homebrew environment variables...'
if ! grep -q 'brew shellenv' "${HOME}/.zprofile"; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing packages from Brewfile..."
brew bundle --file=./Brewfile

echo "Installation complete!"
