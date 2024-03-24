# dotfiles

This repository contains my personal dotfiles for setting up and customizing my development environment. Dotfiles are essential for personalizing your system's software, often hidden in Unix-like systems as they typically start with a dot (.).

## Included Configurations

- **`.zshrc`**: Configures Zsh (Z shell), enhancing interactive use and scripting capabilities. Customizes the shell environment, defines command aliases, and sets up the prompt.
- **`.wezterm.lua`**: Configuration file for WezTerm, a GPU-accelerated terminal emulator. It customizes appearance and behavior.
- **`.starship.toml`**: Configuration file for the Starship prompt, adding information and style to the shell prompt.
- **`neovim/`**: Contains Neovim configurations for a Vim-based text editor, including key mappings, plugins, visual settings, and more, organized into `init.lua` and separate modules within the `lua/` and `after/` directories.
- **`.gitconfig`**: Sets Git user information, aliases, color output preferences, and default behaviors.
- **`Brewfile.lock.json`**: Lists all installed Homebrew packages to ensure consistency across installations.
- **Additional Configurations**:
  - **`Raycast.rayconfig`**, **`mise/config.toml`**, **`github-copilot/versions.json`**: Configuration files for Raycast app launcher, Mise setup tool, and GitHub Copilot versions, respectively.
- **`.zprofile`**: Loaded before `.zshrc` for Z shell, setting up environment variables and executing commands at the start of a Z shell session.

## Installation

To install these dotfiles and configure your environment, follow these steps:

1. **Clone this repository:**

   ```bash
   git clone https://github.com/yossydev/dotfiles.git
   cd dotfiles
   ```

2. Execute the setup script:

   ```
   $ make setup
   ```

   Alternatively, if you prefer to run the script directly:

   ```
   $ ./scripts/setup.sh
   ```

   This script will install Homebrew (on macOS), fetch and install packages from the Brewfile, and place the dotfiles in your home directory. The Makefile simplifies the execution of scripts, making it easier to manage and run setup and update commands.

## Updating Your Configuration

To update your configuration and synchronize with the latest changes in the repository, run:

```
$ make update
```

Or directly:

```
$ ./scripts/update.sh
```

## Warning

Running the setup script will overwrite existing configuration files. It's recommended to backup any important configurations before proceeding.

## Customization

Feel free to fork this repository and modify the configurations to suit your preferences. The structure is designed to be modular, making it easy to add or remove components as needed.
