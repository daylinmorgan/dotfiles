#!/usr/bin/env zsh

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

# Vim Settings
# export VIMINIT='source $MYVIMRC'
# export MYVIMRC='$DOTFILES_DIR/lib/.vimrc'

if is-executable lvim; then
	export EDITOR=lvim
elif is-executable nvim; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi

# spelling correction
# setopt CORRECT
# setopt CORRECT_ALL

# Setup fzf
# ---------
# if [[ $PATH != *$HOME/.fzf/bin* ]]; then
	# export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
# fi
# ---------

# Add lfcd command
# ----------------
if is-executable lf; then
	source "$XDG_CONFIG_HOME/lf/lfcd.sh"
fi
# ----------------
#
if is-executable fnm && ! is-tty; then
	eval "$(fnm env --shell zsh)"
fi
#
if is-executable bat; then
	export BAT_THEME=Catppuccin
	export BAT_STYLE=header,numbers,grid
fi

if is-executable zoxide; then
	export _ZO_FZF_OPTS="--preview 'command lsd --tree --color always --icon always {2..}'"
fi

export ENHANCD_DOT_ARG="up"

if is-tty; then
	export STARSHIP_CONFIG=~/.config/starship/plain.toml
else
	export STARSHIP_CONFIG=~/.config/starship/config.toml
fi

export EGET_BIN=$HOME/bin

# for dotenv
export ZSH_DOTENV_ALLOWED_LIST=$HOME/.cache/dotenv-allowed.list
export ZSH_DOTENV_DISALLOWED_LIST=$HOME/.cache/dotenv-disallowed.list

# mamba
export MAMBA_NO_BANNER=1

# shiv
if is-executable shiv; then
	export SHIV_ROOT=$HOME/.local/share/shiv
fi

# pyenv
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
# export PATH="$PNPM_HOME:$PATH"
add-to-path prepend "$PNPM_HOME:$PATH"

if [ -d "$HOME/.pkgs/google-cloud-sdk" ]; then
	source "$HOME/.pkgs/google-cloud-sdk/completion.zsh.inc"
	# source "$HOME/.pkgs/google-cloud-sdk/path.zsh.inc"
	add-to-path prepend "$HOME/.pkgs/google-cloud-sdk/bin"
fi

if [ -d "$HOME/.deno" ]; then
	export DENO_INSTALL="$HOME/.deno"
	# export PATH="$DENO_INSTALL/bin:$PATH"
	add-to-path prepend "$DENO_INSTALL/bin:$PATH"
fi

if [ -d "$HOME/.bun" ]; then
	# bun completions
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

	# bun
	export BUN_INSTALL="$HOME/.bun"
	# export PATH="$BUN_INSTALL/bin:$PATH"
	add-to-path prepend "$BUN_INSTALL/bin:$PATH"
fi

if [ -d "$HOME/.nimble" ]; then
	# export PATH=/home/daylin/.nimble/bin:$PATH
	add-to-path prepend "$HOME/.nimble/bin"
fi
