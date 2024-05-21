#!/usr/bin/env zsh

export EZA_COLORS="da=37"
export EZA_MIN_LUMINANCE=50

alias ls='eza --icons'
alias l='eza -lbF --git --icons'
alias llm='eza -lbGd --git --sort=modified --icons'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --icons'

alias lS='eza -1'
alias lt='eza --tree --level=2 --icons'
alias l.="eza -a | grep -E '^\.'"

