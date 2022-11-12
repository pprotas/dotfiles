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
brew install --cask obsidian
brew install --cask rectangle-pro
brew install --cask mission-control-plus
brew install --cask topnotch
brew install --cask dozer
brew install --cask alt-tab
brew install --cask monitorcontrol
brew install --cask middle
brew install --cask discretescroll
brew install --cask spotify
brew install --cask whatsapp
brew install --cask 1password
brew install --cask spaceid
brew install --cask karabiner-elements
brew install --cask iterm2
brew install tmux
brew install jq
brew install lazygit
brew install lazydocker
brew install fzf
brew install z
brew install n
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew install starship
brew install neovim --HEAD
brew install docker

# Services
# ========
brew services start yabai
brew services start skhd
