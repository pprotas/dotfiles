#!/bin/bash

echo "[install] INFO: Installation started"

sudo cp bin/gpg-sign-wrapper.sh /usr/local/bin/gpg-sign-wrapper
sudo chmod +x /usr/local/bin/gpg-sign-wrapper

git submodule update --init --recursive

~/dotfiles/symlink.sh
if [[ "$(uname)" == "Darwin" ]]; then
	~/dotfiles/maco.sh
fi

echo "[install] INFO: Installation finished"
