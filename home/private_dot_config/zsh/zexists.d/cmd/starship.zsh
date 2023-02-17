if is-tty; then
	export STARSHIP_CONFIG=~/.config/starship/plain.toml
else
	export STARSHIP_CONFIG=~/.config/starship/config.toml
fi

eval "$(starship init zsh)"
