autoload -Uz compinit
compinit

if is-executable sheldon; then
	eval "$(sheldon -q --config-file ~/.config/sheldon/plugins.toml source)"
fi

is-executable zoxide && eval eval "$(zoxide init zsh --cmd cd)"

if is-executable starship; then
	eval "$(starship init zsh)"
else
	autoload -Uz vcs_info
	precmd() { vcs_info }

	zstyle ':vcs_info:git:*' formats '%b '

	setopt PROMPT_SUBST
	PROMPT='%F{green}%*%f %F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
fi
