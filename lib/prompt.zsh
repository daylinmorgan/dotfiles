#!/usr/bin/env zsh

autoload -Uz compinit
compinit

is-executable zoxide && eval eval "$(zoxide init zsh --cmd cd)"

if is-executable starship; then
	eval "$(starship init zsh)"
else
	echo "no starship = dumber prompt"

	autoload -Uz vcs_info
	precmd() {
		vcs_info
	}

	zstyle ':vcs_info:git:*' formats '%b '

	setopt PROMPT_SUBST
	PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
fi

zstyle ':completion::complete:make:*:targets' call-command true

is-executable fzf && source $DOTFILES_DIR/lib/fzf.zsh

# TODO: make this fail for both no-atuin and no is-tty
is-executable atuin && is-tty || eval "$(atuin init zsh)"
