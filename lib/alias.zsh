#!/usr/bin/env zsh

# system usage
#########################################
alias reload="source ~/.zshrc"
alias rr="rm -rf"
#########################################

#ls type aliases
#########################################
#alias ls='ls -F'
alias l='ls -lh --color=auto'
alias ll="ls -lhA"
alias left='ls -t -1'
alias ls='ls --color=auto'
alias lsl="ls -lhFA | less"
#########################################

# List declared aliases, functions, paths
#########################################
alias aliases="alias | sed 's/=.*//'"
alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"
alias paths='echo -e ${PATH//:/\\n}'
#########################################

# program dependent aliases
#########################################
alias code2="code-insiders"
# ls -> lsd | swap ls for ls-deluxe
if is-executable lsd; then

	is-tty && alias lsd="lsd --icon never"
	alias ls='lsd'
	alias l='lsd -l'
	alias la='lsd -a'
	alias lla='lsd -la'
	alias lt='lsd --tree --depth=3'
	alias lr='lsd -R'

fi
#lazygit
is-executable lazygit && alias lg=lazygit
# source custom tmux.conf with older tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"
alias rc="rclone --filter-from ~/.config/rclone/filter-file.txt"
# prefer nvim if installed
if is-executable lvim; then
	alias vim=lvim
elif is-executable nvim; then
	alias vim=nvim
fi
# gdu defualts
is-executable gdu && alias gdu -I '.*node_modules' -H
# more fzf
alias fzf-bat="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
alias vivaldi="vivaldi-stable"
#zellij
if is-executable zellij; then

	alias zs="zellij -s"
	alias zl="zellij ls"
	alias za="zellij a"

fi
#zenith
alias zenith="zenith -d 0 -n 0"
# pdm
alias pdm-start='eval "$(pdm shell)"'
##########################################
