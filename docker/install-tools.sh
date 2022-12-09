#!/usr/bin/env bash

# eget() {
# 	"$HOME/bin/eget" "$@"
# }
export EGET_BIN=$HOME/bin

curl https://zyedidia.github.io/eget.sh | sh && mv ./eget ./bin/eget

tools $(cat "$HOME/.dotfiles/docker/tools.txt")

# eget rossmacarthur/sheldon
eget tree-sitter/tree-sitter

# installing nvim
eget neovim/neovim --to ./nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
rm nvim.appimage
