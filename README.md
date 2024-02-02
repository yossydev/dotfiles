## dotfiles

This repository contains my personal dotfiles for setting up and customizing my development environment. Dotfiles are configuration files that are used to personalize your system's software. They're called "dotfiles" as they typically start with a dot (.) making them hidden files in Unix-like systems.

## Included Configurations

- zshrc: Configuration file for Zsh (Z shell), enhancing interactive use and scripting capabilities. It customizes the shell environment, defines command aliases, and sets up the prompt.
- wezterm.lua: Configuration file for WezTerm, a GPU-accelerated terminal emulator. It customizes appearance and behavior.
- starship.toml: Configuration file for Starship prompt, enhancing the shell prompt with information and style customization.
- neovim/: Directory containing configuration files for Neovim, a Vim-based text editor. This includes key mappings, plugins, visual settings, and more, organized into init.lua and separate modules within the lua/ and after/ directories.
- gitconfig: Configuration file for Git, setting user information, aliases, preferences for color output, and default behaviors.
- Brewfile.lock.json: Generated file listing all installed Homebrew packages, ensuring consistency across installations.
- Raycast.rayconfig, mise/config.toml, github-copilot/versions.json: Configuration files for Raycast app launcher, Mise setup tool, and GitHub Copilot versions, respectively.
- starship.toml: Configuration file for the Starship prompt, customizing your command line interface.
- wezterm.lua: Configuration file for WezTerm, a terminal emulator, defining key bindings and appearance.
- zprofile: Configuration file loaded before zshrc for Z shell, setting up environment variables and executing commands at the start of a Z shell session.

## Installation

To install these dotfiles and configure your environment:

1. Clone this repository:

```bash
git clone https://github.com/yossydev/dotfiles.git
cd dotfiles
```

2. Execute the setup script:

```
./scripts/setup.sh
```

This script will install Homebrew (on macOS), fetch and install packages from the Brewfile, and place the dotfiles in your home directory.

## Warning

Running the setup script will overwrite existing configuration files. It's recommended to backup any important configurations before proceeding.

## Customization

Feel free to fork this repository and modify the configurations to suit your preferences. The structure is designed to be modular, making it easy to add or remove components as needed.
