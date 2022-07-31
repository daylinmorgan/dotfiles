autoload -Uz compinit
compinit

if is-executable sheldon; then
	eval "$(sheldon -q --config-file ~/.config/sheldon/plugins.toml source)"
fi

# TODO: make decent fall back shell

is-executable starship && eval "$(starship init zsh)"

is-executable zoxide && eval eval "$(zoxide init zsh --cmd cd)"
