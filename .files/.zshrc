#!/bin/zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Change default config home
export XDG_CONFIG_HOME="$HOME/.config"

# Emacs keybinds
bindkey -e

# Aliases
alias vim='nvim'
alias sudo='sudo '
alias ..='cd ..'
alias '??'='gh copilot suggest -t shell'
alias explain='gh copilot explain'
alias ls="lsd"
alias cat="bat"
alias find="fd"
alias sed="sd"

# General shell exports
export EDITOR=nvim 
export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if [[ "$OSTYPE" == "darwin" ]]; then
  # Load p10k
  source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
  # H1
  export HACKERONE_ON_DOCKER=true
  # Ruby stuff
  export PATH="$(brew --prefix)/opt/ruby@3.2/bin:$(brew --prefix)/opt/ruby@3.2/lib/ruby/gems/3.2.0/gems:$PATH"
else
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# mise
eval "$(mise activate zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"

# z
eval "$(zoxide init zsh)"
