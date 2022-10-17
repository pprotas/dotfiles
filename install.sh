#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Starship
brew install starship

# Install FiraCode Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font

# Install NeoVim
brew install --HEAD neovim

# Install LunarVim
bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)

# Install rbenv
brew install rbenv ruby-build

# Install zsh-vi-mode
brew install zsh-vi-mode

# Symlink source-controlled dotfiles to home directory
dir=~/dotfiles
olddir=~/dotfiles_old            
files="config/nvim/init.vim config/lvim/config.lua gitconfig gitignore_global hushlogin ideavimrc tmux.conf vimrc zshrc zshrc-linux zshrc-mac"    r

echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
