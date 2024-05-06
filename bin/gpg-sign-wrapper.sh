#!/bin/bash

if [[ "$(uname)" == "Darwin" ]]; then
	/Applications/1Password.app/Contents/MacOS/op-ssh-sign "$@"
else
	/mnt/c/Users/Pawel/AppData/Local/1Password/app/8/op-ssh-sign-wsl "$@"
fi
