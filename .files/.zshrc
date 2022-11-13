#!/bin/zsh

# Oh My Zsh
export ZSH="${HOME}/.oh-my-zsh"

DISABLE_UPDATE_PROMPT="true"
ENABLE_CORRECTION="true"

plugins=(zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Aliases
alias vim='lvim'
alias sudo='sudo '

# General shell exports
export EDITOR=lvim 
export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load correct .zshrc-* based on system OS
case `uname` in
	Darwin)
		source $HOME/.zshrc-mac
	;;
	Linux)
		source $HOME/.zshrc-linux
	;;
esac

# Load Starship
eval "$(starship init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"

# z
. /opt/homebrew/etc/profile.d/z.sh

# Ruby
eval "$(rbenv init - zsh)"

# H1
export HACKERONE_ON_DOCKER=true
