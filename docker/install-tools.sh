#!/usr/bin/env bash

export PATH="$PATH:/home/daylin/bin:/home/daylin/.dotfiles/bin"
export EGET_BIN=/home/$USER/bin
export EGET_CONFIG=/home/$USER/.config/eget/eget.toml
export DOTFILES_DIR=/home/$USER/.dotfiles

echo $HOME
# until next version release
cp "$EGET_CONFIG" "/root/.eget.toml"

curl https://zyedidia.github.io/eget.sh | sh && mv ./eget ./bin/eget
eget Tomwright/dasel --asset dasel_linux_amd64

aweget --verbose \
	$(awk '{printf "-i %s ", $0}' "$DOTFILES_DIR/docker/tools.txt")

# eget rossmacarthur/sheldon
eget tree-sitter/tree-sitter --to "$EGET_BIN/tree-sitter"

# installing nvim
eget neovim/neovim --to ./nvim.appimage --pre-release
./nvim.appimage --appimage-extract >/dev/null 2>&1
./squashfs-root/AppRun --version

mv squashfs-root /
ln -s /squashfs-root/AppRun /usr/bin/nvim
rm nvim.appimage
