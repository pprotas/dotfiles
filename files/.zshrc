#!/bin/zsh

# git zsh completion
if type brew &>/dev/null; then
 FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

 autoload -Uz compinit
 compinit
fi

# pure
autoload -U promptinit; promptinit
prompt pure

# <C-r> history
HISTFILE=~/.zsh_history
HISTSIZE=99999999
SAVEHIST=99999999
setopt append_history

# Change default config home
export XDG_CONFIG_HOME="$HOME/.config"

# Emacs keybinds
bindkey -e

# Aliases
alias vim='nvim'
alias sudo='sudo '
alias ..='cd ..'
alias e='$EDITOR'

# General shell exports
export EDITOR="zed --wait"

# ruby
export RUBY_YJIT_ENABLE=1

# replace macOS BSD utils with GNU utils
PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# mise
eval "$(mise activate zsh)"

# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"

# z
eval "$(zoxide init zsh)"

# user-local binaries
export PATH="$HOME/.local/bin:$PATH"

# direnv hook
eval "$(direnv hook zsh)"
