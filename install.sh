#!/bin/bash

echo "[install] INFO: Installation started"
# Install oh-my-zsh if necessary
if ! [[ -d ~/.oh-my-zsh ]]; then
  echo "[ohmyzsh] Installation started"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
  echo "[ohmyzsh] Installation finished"
fi

~/dotfiles/symlink.sh
~/dotfiles/maco.sh

echo "[install] INFO: Installation finished"
