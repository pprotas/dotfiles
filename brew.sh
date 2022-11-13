#!/usr/bin/env sh

# Set-up
# ======
# Install Homebrew if it's not installed already
if ! brew_loc="$(type -p brew)" || [[ -z "$brew_loc" ]]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# If necessary, update all installed packages
brew update
brew upgrade

# Packages
# ========
brew bundle

# Services
# ========
brew services start yabai
brew services start skhd
