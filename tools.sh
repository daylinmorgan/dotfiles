#! /usr/bin/env bash

BIN_DIR=$HOME/bin
mkdir -p $BIN_DIR

if ! $(is-executable eget); then
	echo "I don't see eget on your path..."
	read -p "Do you want to download it to ${BIN_DIR}? " -n 1 -r
	echo    # (optional) move to a new line
	if [[ ! $REPLY =~ ^[Yy]$ ]]
	then
		exit 1
	else
		curl https://zyedidia.github.io/eget.sh | sh
		mv eget $BIN_DIR/eget
	fi
fi

echo "downloading binaries from github to $EGET_BIN"

alias eget="eget --system linux/amd64"

# environment
eget rossmacarthur/sheldon
eget starship/starship --asset starship-x86_64-unknown-linux-gnu.tar.gz

# general tools
eget Peltoche/lsd --asset x86_64-unknown-linux-gnu.tar.gz
eget BurntSushi/ripgrep
eget sharkdp/fd --asset x86_64-unknown-linux-gnu.tar.gz
eget sharkdp/bat --asset x86_64-unknown-linux-gnu.tar.gz
eget ClementTsang/bottom --asset x86_64-unknown-linux-gnu.tar.gz -f btm

# git 
eget jesseduffield/lazygit

# writing
eget neovim/neovim

# eget dundee/gdu eget doesn't support .tgz?

# install gdu manually
gdu_release=https://github.com/dundee/gdu/releases/download/v5.8.1/gdu_linux_amd64.tgz
echo "fetching gdu manually"
wget $gdu_release
tar -xzvf gdu_linux_amd64.tgz
mv gdu_linux_amd64 $EGET_BIN/gdu
rm gdu*
