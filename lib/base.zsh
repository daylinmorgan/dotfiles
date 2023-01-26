#!/usr/bin/env zsh

autoload -Uz compinit
compinit

# XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.local/cache}"

export HISTFILE=~/.zsh_history
export HISTSIZE=32768
export HISTFILESIZE="${HISTSIZE}"
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups
export LESS='-R'
export LS_COLORS="ow=1;34:tw=1;34:st=00;"

# add completions to fpath
fpath=($DOTFILES_DIR/lib/completions $fpath)

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY
# Disable autocd
unsetopt autocd


