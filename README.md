# dotfiles

This repository contains my personal dotfiles. These files are used to customize various aspects of my development environment.

## Included Configurations

- `zshrc`: This is the configuration file for Zsh (Z shell), a shell designed for interactive use and as a scripting language. The Zsh configuration file can customize the shell environment, define command aliases, and set up the prompt.
- `wezterm.lua`: This is the configuration file for WezTerm, a GPU-accelerated cross-platform terminal emulator and multiplexer. It allows you to customize the terminal's appearance and behavior.
- `starship.toml`: This is the configuration file for Starship, a customizable shell prompt. It allows you to customize the prompt's appearance and the information it displays.
- `neovim`: This is the configuration file for Neovim, a hyperextensible Vim-based text editor. It allows you to customize various aspects of Neovim, such as key mappings, plugins, and visual settings.
- `gitconfig`: This is the configuration file for Git, a distributed version control system. It can include aliases, user identity information, and preferences for things like color output and default behavior.
- `Brewfile`: This is a list of software packages to be installed with Homebrew, a package manager for macOS. It can include applications, utilities, and more.

## Installation

Follow these steps to install the dotfiles:

1. First, clone this repository:

   ```bash
   git clone https://github.com/yossydev/dotfiles.github

   cd dotfiles
   ```

2. Run the setup.sh script:

   ```
   ./scripts/setup.sh
   ```

This script installs Homebrew, installs packages from the Brewfile, and copies the dotfiles to your home directory.

That's it! Open a new terminal window to see the changes.

## Warning

This script overwrites existing configuration files. If you have any important settings, it's recommended to back them up before running the script.
