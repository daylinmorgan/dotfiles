#!/usr/bin/env zsh

export GPG_TTY="$TTY"
gpgconf --launch gpg-agent
