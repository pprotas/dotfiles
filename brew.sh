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
echo "[brew] INFO: Determining machine type..."
read -p "Is this a personal or work laptop? (personal/work): " machine_type

case "$machine_type" in
  personal|p)
    echo "[brew] INFO: Installing packages for personal machine"
    PERSONAL_MACHINE=1 brew bundle
    ;;
  work|w)
    echo "[brew] INFO: Installing packages for work machine"
    WORK_MACHINE=1 brew bundle
    ;;
  *)
    echo "[brew] WARNING: Invalid selection. Installing common packages only"
    brew bundle
    ;;
esac

echo "[brew] INFO: Installation finished"
