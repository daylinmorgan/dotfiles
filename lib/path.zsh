#!/usr/bin/env zsh

add-to-path prepend "/bin"
add-to-path prepend "/usr/bin"
add-to-path prepend "/usr/local/bin"

# home paths
paths=("bin" ".local/bin" ".cargo/bin" "go/bin" ".extra/bin")
for directory in "${paths[@]}"; do
	add-to-path prepend "$HOME/$directory"
done

export PATH


