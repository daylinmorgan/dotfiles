#!/usr/bin/env zsh

if is-exe lsd; then
  export _ZO_FZF_OPTS="--preview 'command lsd --tree --color always --icon always {2..}'"
fi

eval "$(zoxide init zsh --cmd cd)"

