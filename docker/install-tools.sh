#!/usr/bin/env bash

# eget() {
# 	"$HOME/bin/eget" "$@"
# }
#
export PATH="$PATH:/home/daylin/bin:/home/daylin/.dotfiles/bin"
export EGET_BIN=/home/$USER/bin
export DOTFILES_DIR=/home/$USER/.dotfiles

curl https://zyedidia.github.io/eget.sh | sh && mv ./eget ./bin/eget

tools $(cat "$DOTFILES_DIR/docker/tools.txt")

# eget rossmacarthur/sheldon
eget tree-sitter/tree-sitter

# installing nvim
eget neovim/neovim --to ./nvim.appimage --pre-release
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
rm nvim.appimage
