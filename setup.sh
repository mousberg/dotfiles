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

# Run stow for each directory
for dir in */; do
    dir=${dir%*/}
    echo -e "${GREEN}Stowing $dir...${NC}"
    stow "$dir"
done

echo -e "${GREEN}Dotfiles setup complete!${NC}" 