# Dotfiles

My personal dotfiles for macOS, managed with GNU Stow.

## Structure

This repository follows a simple, one-directory-per-tool approach:

- `nvim/` - Neovim configuration (symlinked to ~/.config/nvim/)
- `tmux/` - Tmux configuration (symlinked to ~/.tmux.conf)
- `zsh/` - ZSH configuration
- `starship/` - Starship prompt configuration
- `git/` - Git configuration
- `ghostty/` - Ghostty terminal configuration (specially handled)
- `ssh/` - SSH configuration (copied, not symlinked)

## What's Included

- zsh: ZSH configuration with Oh My Zsh
- starship: Starship prompt configuration
- git: Git configuration
- ghostty: Ghostty terminal emulator configuration
- ssh: SSH client configuration (securely copied, not symlinked)
- tmux: Terminal multiplexer configuration with plugins
- nvim: Neovim configuration (basic setup)

## Installation

### Prerequisites

- [GNU Stow](https://www.gnu.org/software/stow/)
- [Starship](https://starship.rs/)
- [Oh My Zsh](https://ohmyz.sh/)
- [Ghostty](https://mitchellh.com/ghostty)
- [Tmux](https://github.com/tmux/tmux)
- [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm)
- [Neovim](https://neovim.io/) (v0.8.0+)

### Setup

Clone this repository to your home directory:

```bash
git clone https://github.com/YOUR_USERNAME/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

Run the setup script to symlink everything:

```bash
./setup.sh
```

The setup script stows each directory and handles special cases like Ghostty, Neovim, and SSH.

### Tmux Setup

After installing the dotfiles, you'll need to install the Tmux Plugin Manager (the setup script will do this automatically if it's not already installed). Then start tmux and press `prefix + I` (default prefix is Ctrl-a) to install the plugins.

## Adding New Configurations

1. Create a new directory for the tool/application
2. Add configuration files to that directory
3. Run `stow <directory-name>` to create the symlinks

For applications that store their config in ~/.config (like Neovim):
- Add configuration files to a dedicated directory (e.g., nvim/)
- Update setup.sh to create appropriate symlinks

## Updating

Pull the latest changes and run the setup script again:

```bash
git pull
./setup.sh
``` 