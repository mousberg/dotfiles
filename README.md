# Dotfiles

My personal dotfiles for macOS, managed with GNU Stow.

## Structure

This repository follows XDG Base Directory specification with a unified stow approach:

- `.config/` - Configuration files that go into `~/.config/`
  - `nvim/` - Neovim configuration
  - `git/` - Git configuration
- `tmux/` - Tmux configuration (symlinked to ~/.tmux.conf)
- `zsh/` - ZSH configuration
- `starship/` - Starship prompt configuration
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

The setup script uses stow to create symlinks for all configurations while handling special cases like Ghostty and SSH.

### Tmux Setup

After installing the dotfiles, you'll need to install the Tmux Plugin Manager (the setup script will do this automatically if it's not already installed). Then start tmux and press `prefix + I` (default prefix is Ctrl-a) to install the plugins.

## Adding New Configurations

For XDG-compliant applications (modern):
1. Add configuration files to `.config/<app-name>/`

For traditional dotfiles (legacy):
1. Add configuration files to a directory named after the tool

## Updating

Pull the latest changes and run the setup script again:

```bash
git pull
./setup.sh
``` 