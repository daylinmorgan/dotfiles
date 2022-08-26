#!/usr/bin/env zsh

# Start with system path
# Retrieve it from getconf, otherwise it's just current $PATH
prepend-path() {
	[ -d $1 ] && PATH="$1:$PATH"
}

is-executable getconf && PATH=$($(command -v getconf) PATH)

# Prepend new items to path (if directory exists)
prepend-path "/bin"
prepend-path "/usr/bin"
prepend-path "/usr/local/bin"

PATH="$DOTFILES_DIR/bin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.cargo/bin:$PATH"
PATH="$PATH:/usr/local/go/bin"
PATH="/usr/local/texlive/2021/bin/x86_64-linux:$PATH"
PATH="$HOME/go/bin:$PATH"
# prepend-path "/sbin"
# prepend-path "/usr/sbin"
# prepend-path "/usr/local/sbin"

# Remove duplicates (preserving prepended items)
# Source: http://unix.stackexchange.com/a/40755

PATH=$(echo -n $PATH | awk -v RS=: '{ if (!arr[$0]++) {printf("%s%s",!ln++?"":":",$0)}}')
PATH="$(perl -e 'print join(":", grep { not $seen{$_}++ } split(/:/, $ENV{PATH}))')"

# PATH=$(printf %s "$PATH" |
# 	awk -vRS=: -vORS= '!a[$0]++ {if (NR>1) printf(":"); printf("%s", $0) }')
# # Wrap up

export PATH
