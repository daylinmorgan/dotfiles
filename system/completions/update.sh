#!/usr/bin/env zsh

gen() {
  if is-executable $1;then 
    echo "$1 updated"
    "$@" > "_$argv[1]"
  else;
    echo "skipping $1"
  fi
}

echo "GENERATING COMPLETION SCRIPTS"
echo "-----------------------------"
gen sheldon completions --shell zsh
gen just --completions zsh
gen zellij setup --generate-completion zsh
