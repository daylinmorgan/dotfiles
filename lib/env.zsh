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

autoload -Uz compinit && compinit

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY

# Disable autocd
unsetopt autocd

is-executable nvim && export EDITOR=nvim || export EDITOR=vim

is-executable lf && source "$XDG_CONFIG_HOME/lf/lfcd.sh"

if is-executable fnm && ! is-tty; then
	eval "$(fnm env --shell zsh)"
fi

is-executable bat && \
	export BAT_THEME=Catppuccin; \
	export BAT_STYLE=header,numbers,grid


is-executable zoxide && \
	export _ZO_FZF_OPTS="--preview 'command lsd --tree --color always --icon always {2..}'"

is-tty && \
	export STARSHIP_CONFIG=~/.config/starship/plain.toml \
	|| \
	export STARSHIP_CONFIG=~/.config/starship/config.toml

export EGET_BIN=$HOME/bin

# for dotenv
export ZSH_DOTENV_ALLOWED_LIST=$HOME/.cache/dotenv-allowed.list
export ZSH_DOTENV_DISALLOWED_LIST=$HOME/.cache/dotenv-disallowed.list

# mamba
export MAMBA_NO_BANNER=1

# shiv
is-executable shiv && export SHIV_ROOT=$HOME/.local/share/shiv

# pyenv
if [ -d "$HOME/.pyenv" ]; then
	export PYENV_VIRTUALENV_DISABLE_PROMPT=1
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"
fi

# pnpm
is-executable pnpm && \
	export PNPM_HOME="$HOME/.local/share/pnpm"; \
	add-to-path prepend "$PNPM_HOME"

[ -d "$HOME/.pkgs/google-cloud-sdk" ] && \
	source "$HOME/.pkgs/google-cloud-sdk/completion.zsh.inc"; \
	add-to-path prepend "$HOME/.pkgs/google-cloud-sdk/bin"

[ -d "$HOME/.deno" ] && \
	export DENO_INSTALL="$HOME/.deno"; \
	add-to-path prepend "$DENO_INSTALL/bin"

if [ -d "$HOME/.bun" ]; then
	# bun completions
  [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

	# bun
	export BUN_INSTALL="$HOME/.bun"
	add-to-path prepend "$BUN_INSTALL/bin"
fi

[ -d "$HOME/.nimble" ] && add-to-path prepend "$HOME/.nimble/bin"
