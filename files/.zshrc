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
export EDITOR=zed
export PATH="$HOME/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# ruby
export RUBY_YJIT_ENABLE=1

if [[ "$(uname)" == "Darwin" ]]; then
else
  export GIT_SSH_COMMAND=ssh.exe
  alias ssh='ssh.exe'
  alias ssh-add='ssh-add.exe'
fi

# mise
eval "$(mise activate zsh)"

# fzf
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="rg --files --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"

# z
eval "$(zoxide init zsh)"

# pnpm
export PNPM_HOME="/Users/pawel/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
