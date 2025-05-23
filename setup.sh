#!/bin/bash

# Stow standard configs (exclude special cases)
for dir in */; do
    dir=${dir%*/}
    if [ "$dir" != "ghostty" ] && [ "$dir" != "ssh" ] && [ "$dir" != "tmux" ]; then
        stow "$dir"
    fi
done

# Special handling for Ghostty
mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
ln -sf ~/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config

# Special handling for SSH (copy, don't symlink)
mkdir -p ~/.ssh && chmod 700 ~/.ssh
cp -f ssh/config ~/.ssh/config && chmod 600 ~/.ssh/config

# Special handling for tmux
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
mkdir -p ~/.config/tmux/scripts
ln -sf ~/dotfiles/tmux/scripts/cal.sh ~/.config/tmux/scripts/cal.sh

echo "Dotfiles setup complete!" 