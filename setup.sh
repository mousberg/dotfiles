#!/bin/bash

# Stow standard configs (exclude special cases)
for dir in */; do
    dir=${dir%*/}
    if [ "$dir" != "ghostty" ] && [ "$dir" != "ssh" ]; then
        stow "$dir"
    fi
done

# Special handling for Ghostty
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -sf ~/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config

# Special handling for SSH (copy, don't symlink)
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cp -f ssh/config ~/.ssh/config && chmod 600 ~/.ssh/config

# Install Tmux Plugin Manager if not already installed
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo "Dotfiles setup complete!" 