#!/usr/bin/env zsh

alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'

alias reload="source ~/.zshrc"
alias rr="rm -rf"
alias c="clear"

# ls -> lsd | swap ls for ls-deluxe if it exists
alias ls='ls --color=auto'
alias l='ls -lh'
alias la="ls -a"
alias ll="ls -lhA"
alias lr='ls -R'
alias lla="ls -la"
alias lsl="ls -lhFA | less"
alias left='ls -t -1'

if is-executable lsd; then
	is-tty && alias lsd="lsd --icon never"
	alias ls='lsd'
	alias lt='lsd --tree --depth=3'
else
	alias lt="tree -L 3"
fi

is-executable lazygit && alias lg=lazygit

# source custom tmux.conf with older tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias rc="rclone --filter-from ~/.config/rclone/filter-file.txt"

# prefer lvim > nvim > vim
if is-executable lvim; then
	alias vim=lvim
elif is-executable nvim; then
	alias vim=nvim
fi

is-executable gdu && alias gdu -I '.*node_modules' -H

alias fzf-bat="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vivaldi="vivaldi-stable"

if is-executable zellij; then
	alias zs="zellij -s"
	alias zl="zellij ls"
	alias za="zellij a"
fi

alias zenith="zenith -d 0 -n 0"

alias pdm-start='eval "$(pdm shell)"'

# GNU make
alias mkrt='make -C $(git rev-parse --show-toplevel)'
alias mk="make"
alias mkc="make -C"

alias umamba="micromamba"

alias g="git"
