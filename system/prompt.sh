autoload -Uz compinit
compinit

eval "$(sheldon -q --config-file ~/.config/sheldon/plugins.toml source)"

eval "$(starship init zsh)"
