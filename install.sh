#!/bin/bash

echo "[install] INFO: Installation started"

~/dotfiles/maco.sh

sudo n install lts

# Install oh-my-zsh if necessary
if ! [[ -d ~/.oh-my-zsh ]]; then
  echo "[ohmyzsh] Installation started"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  echo "[ohmyzsh] Installation finished"
fi

# Install LunarVim if necessary
if ! lvim_loc="$(type -p lvim)" || [[ -z "$lvim_loc" ]]; then
  zsh $(bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) "" --yes --install-dependencies)
fi

~/dotfiles/symlink.sh

echo "[install] INFO: Installation finished"
