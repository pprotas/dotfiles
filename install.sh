#!/bin/bash

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Homebrew packages
brew install starship
brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
brew install --HEAD neovim
LV_BRANCH=rolling bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/rolling/utils/installer/install.sh)
brew install tmux
brew install rbenv ruby-build
brew install yabai
brew install skhd
brew install jq
brew install lazygit
brew install lazydocker

# Symlink source-controlled dotfiles to home directory
dir=~/dotfiles
olddir=~/dotfiles_old            
files="config/nvim/init.vim config/lvim/config.lua config/helix/config.toml config/yabai/yabairc config/skhd/skhdrc gitconfig gitignore_global hushlogin ideavimrc tmux.conf vimrc zshrc zshrc-linux zshrc-mac"    

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
