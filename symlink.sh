#!/bin/bash

# Symlinks the .files directory to the home directory
echo "[symlink] INFO: Installation started"

# Method to handle errors
function error {
    echo "[symlink] ERROR: $1" >&2
    exit 2
}

# Set working dir
cd ~/dotfiles/.files || error "No .files directory found"

# Get all the necessary dotfiles
dotfiles_dir="${HOME}/dotfiles/.files"
dotfiles=$(find "$dotfiles_dir" -depth 1)

for file in $dotfiles; do
  new_file="${file#"$dotfiles_dir/"}"
  new_file="${HOME}/${new_file}"

  if [[ -d $new_file ]]; then
    rm -rf "$new_file"
  elif [[ -e $new_file ]]; then
    rm -f "$new_file"
  fi 

  echo "[symlink] INFO: Symlinking ${new_file} (home dir) to ${file} (dotfile)"
  ln -sfn "$file" "$new_file"
done
echo "[symlink] INFO: Installation finished"
