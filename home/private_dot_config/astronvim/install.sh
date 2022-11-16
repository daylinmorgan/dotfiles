#!/usr/bin/env bash

set -e

deps=(
  rg # ripgrep
  lazygit
  gdu
  btm # bottom
  python
  node
  tree-sitter
)

# TODO: make sure tree-sitter is rust version?

is-cmd() {
  if [ -x "$(command -v "$1")" ]; then
    return 0
  else
    return 1
  fi
}

install-astronvim(){
  echo "Installing astronvim"

  if [[ -d ~/.config/nvim ]]; then
    echo "backing up old nvim config"
    mv ~/.config/nvim ~/.config/nvim.bak-$(date +'%s')
  fi

  if [[ -d ~/.local/share/nvim/site ]]; then
    echo "backing up old nvim site directory"
    mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak-$(date +'%s')
  fi

  git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
  nvim +PackerSync

}

echo "Checking for optional dependencies"

check-dep(){
  if is-cmd "$1"; then
    printf '%15s \033[32m%s\033[0m\n' "$1" 'yes'
  else
    printf '%15s \033[31m%s\033[0m\n' "$1" 'no'
  fi
}

install-astronvim

for dep in "${deps[@]}"; do
  check-dep "$dep"
done
