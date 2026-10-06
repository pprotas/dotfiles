#!/bin/bash

echo "[install] INFO: Installation started"

~/dotfiles/brew.sh

# Real dir so stow links its children; AWS VPN Client rejects a symlinked log path.
mkdir -p ~/.config
stow -d ~/dotfiles -t ~ files

~/dotfiles/osconfig.sh

echo "[install] INFO: Installation finished"
