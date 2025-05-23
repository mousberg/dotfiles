#!/bin/bash

# Set up colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Setting up dotfiles...${NC}"

# Check if stow is installed
if ! command -v stow &> /dev/null; then
    echo -e "${YELLOW}Stow is not installed. Please install it first.${NC}"
    echo "For macOS: brew install stow"
    echo "For Ubuntu/Debian: sudo apt-get install stow"
    echo "For Fedora: sudo dnf install stow"
    exit 1
fi

# Run stow for each directory (excluding ghostty and ssh which need special handling)
for dir in */; do
    dir=${dir%*/}
    if [ "$dir" != "ghostty" ] && [ "$dir" != "ssh" ]; then
        echo -e "${GREEN}Stowing $dir...${NC}"
        stow "$dir"
    fi
done

# Special handling for Ghostty configuration
if [ -d "ghostty" ]; then
    echo -e "${GREEN}Setting up Ghostty configuration...${NC}"
    # Create Ghostty config directory if it doesn't exist
    mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty
    
    # Backup existing config if it exists and is not a symlink
    if [ -f ~/Library/Application\ Support/com.mitchellh.ghostty/config ] && [ ! -L ~/Library/Application\ Support/com.mitchellh.ghostty/config ]; then
        echo -e "${YELLOW}Backing up existing Ghostty config...${NC}"
        mkdir -p ~/Library/Application\ Support/com.mitchellh.ghostty.bak
        mv ~/Library/Application\ Support/com.mitchellh.ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty.bak/
    fi
    
    # Remove existing symlink if it exists
    if [ -L ~/Library/Application\ Support/com.mitchellh.ghostty/config ]; then
        rm ~/Library/Application\ Support/com.mitchellh.ghostty/config
    fi
    
    # Create symlink to our dotfiles
    ln -s ~/dotfiles/ghostty/config ~/Library/Application\ Support/com.mitchellh.ghostty/config
    echo -e "${GREEN}Ghostty configuration linked!${NC}"
fi

# Special handling for SSH configuration
if [ -d "ssh" ]; then
    echo -e "${GREEN}Setting up SSH configuration...${NC}"
    # Create SSH directory if it doesn't exist
    mkdir -p ~/.ssh
    
    # Set proper permissions for SSH directory
    chmod 700 ~/.ssh
    
    # Backup existing config if it exists and is not a symlink
    if [ -f ~/.ssh/config ] && [ ! -L ~/.ssh/config ]; then
        echo -e "${YELLOW}Backing up existing SSH config...${NC}"
        cp ~/.ssh/config ~/.ssh/config.bak
    fi
    
    # Copy config file (we don't symlink for security reasons)
    if [ -f "ssh/config" ]; then
        cp ssh/config ~/.ssh/config
        chmod 600 ~/.ssh/config
        echo -e "${GREEN}SSH configuration copied!${NC}"
    fi
fi

echo -e "${GREEN}Dotfiles setup complete!${NC}" 