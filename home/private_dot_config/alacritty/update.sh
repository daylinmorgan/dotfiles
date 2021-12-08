#!/usr/bin/env bash

# run this from within WSL

files=(alacritty.yml dracula.yml dracula-pro.yml)

for file in "${files[@]}"
do
	cp -v $DOTFILES_DIR/config/alacritty/$file /mnt/c/Users/daylin/AppData/Roaming/alacritty/$file
done

