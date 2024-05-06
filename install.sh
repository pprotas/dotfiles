#!/bin/bash

echo "[install] INFO: Installation started"

if [[ "$(uname)" == "Darwin" ]]; then
	~/dotfiles/maco.sh
fi

cp bin/gpg-sign-wrapper.sh /usr/local/bin/gpg-sign-wrapper
sudo chmod +x /usr/local/bin/gpg-sign-wrapper

~/dotfiles/symlink.sh

echo "[install] INFO: Installation finished"
