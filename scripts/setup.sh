#!/bin/bash
set -e

mkdir -p "${HOME}/.config/nvim"
mkdir -p "${HOME}/.config/mise"
mkdir -p "${HOME}/.config/git"

echo "Copying dotfiles to home directory..."
cp zshrc "${HOME}/.zshrc"
cp zprofile "${HOME}/.zprofile"
cp wezterm.lua "${HOME}/.wezterm.lua"
cp gitconfig "${HOME}/.gitconfig"

echo "Copying nvim directory to ~/.config..."
cp -r nvim "${HOME}/.config/"

echo "Copying starship.toml to ~/.config..."
cp starship.toml "${HOME}/.config/starship.toml"

echo "Copying nvim directory to ~/.config..."
cp global_git_ignore "${HOME}/.config/git/"

echo "Copying mise directory to ~/.config..."
cp -r mise "${HOME}/.config/"

if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo 'Evaluating Homebrew environment variables...'
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}/.zprofile"
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing packages from Brewfile..."
brew bundle --file=./Brewfile

echo "Installation complete!"
