#!/bin/bash

echo "[brew] INFO: Installation started"

# Set-up
# ======
# Install Homebrew if it's not installed already
if ! brew_loc="$(type -p brew)" || [[ -z "$brew_loc" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# If necessary, update all installed packages
brew update
brew upgrade

# Machine type selection
# ======================
machine_file="$HOME/.config/dotfiles/machine"
if [[ ! -f "$machine_file" ]]; then
  read -p "Is this a personal or work laptop? (personal/work): " machine_type
  case "$machine_type" in
    personal|p) machine_type=personal ;;
    work|w) machine_type=work ;;
    *) echo "[brew] ERROR: Invalid selection"; exit 1 ;;
  esac
  mkdir -p "$(dirname "$machine_file")"
  echo "$machine_type" > "$machine_file"
fi
echo "[brew] INFO: Installing packages for $(cat "$machine_file") machine"
brew bundle --file ~/dotfiles/Brewfile

echo "[brew] INFO: Installation finished"
