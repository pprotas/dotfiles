#!/bin/bash
# Symlinks the .files directory to the home directory

# Method to handle errors
function error {
    echo "ERROR: $1" >&2
    exit 2
}

# Check if oh-my-zsh is installed, and error out if it isn't.
# This is necessary because oh-my-zsh messes up .zshrc
if ! [[ -d ~/.oh-my-zsh ]]; then
  error "Oh My Zsh is not installed. Please install it before running this script."
fi

# Set working dir
cd ~/dotfiles/.files || error "No .files directory found"

# Get all the necessary dotfiles
dotfiles_dir="${HOME}/dotfiles/.files"
dotfiles=$(find "$dotfiles_dir" -depth 1)

echo "Symlinking dotfiles..."
for file in $dotfiles; do
  new_file="${file#"$dotfiles_dir/"}"
  new_file="${new_file/#./${HOME}/.}"
  ln -sf "$file" "$new_file"
done
echo "Done!"
