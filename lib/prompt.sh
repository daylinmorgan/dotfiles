autoload -Uz compinit
compinit

eval "$(sheldon -q --config-file ~/.config/sheldon/plugins.toml source)"

is-executable zoxide && eval eval "$(zoxide init zsh --cmd cd)"

eval "$(starship init zsh)"
