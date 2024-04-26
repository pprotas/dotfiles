#!/bin/bash

echo "[symlink] INFO: Installation started"

function error {
    echo "[symlink] ERROR: $1" >&2
    exit 2
}

cd ~/dotfiles/.files || error "No .files directory found"

dotfiles_dir="${HOME}/dotfiles/.files"
IFS=$'\n' dotfiles=($(fd . "$dotfiles_dir" -Hd 1))

for file in "${dotfiles[@]}"; do
  new_file="${file#"$dotfiles_dir/"}"
  new_file="${HOME}/${new_file}"

  # Check if the destination file is a symlink and points to the source
  if [[ -L "$new_file" && "$(readlink -f "$new_file")" == "$file" ]]; then
    echo "[symlink] WARNING: Skipping symlink for $new_file as it already points to $file"
    continue
  fi

  # Remove existing file or directory
  if [[ -d $new_file ]]; then
    rm -rf "$new_file"
  elif [[ -e $new_file ]]; then
    rm -f "$new_file"
  fi 

  echo "[symlink] INFO: Symlinking ${new_file} (home dir) to ${file} (dotfile)"
  ln -sfn "$file" "$new_file" || error "Failed to create symlink for $new_file"
done

echo "[symlink] INFO: Installation finished"
