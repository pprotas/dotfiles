#!/bin/bash

echo "[install] INFO: Installation started"

~/dotfiles/maco.sh
~/dotfiles/symlink.sh

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
  export PATH="/opt/homebrew/bin:$PATH"
  bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) "" --yes --install-dependencies
  mv ~/.config/lvim.old/config.lua ~/.config/lvim
  rm -rf ~/.config/lvim.old
fi


echo "[install] INFO: Installation finished"
echo "[install] INFO: Optional/manual next steps:"
echo " - Restart your terminal and machine"
echo " - Run :PackerSync in lvim"
echo " - Set up the necessary license keys or credentials for the installed applications"
echo " - Organise the dock & menu bar"
echo " - Change wallpaper"
echo " - Use TouchID for sudo: https://azimi.io/how-to-enable-touch-id-for-sudo-on-macbook-pro-46272ac3e2df"
