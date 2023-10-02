#!/usr/bin/env zsh

export GPG_TTY=$(tty)
gpgconf --launch gpg-agent
