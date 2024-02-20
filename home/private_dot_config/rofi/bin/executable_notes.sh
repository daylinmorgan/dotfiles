#!/usr/bin/env bash

styles="$(dirname "$(which $0)")/../styles"
rofi_cmd="rofi -theme $styles/notes.rasi -dmenu -p notes -l 0"

# Rofi command to pipe into, can add any options here
# rofi_command="rofi -dmenu -theme $rofi_styles/bluetooth.rasi -no-fixed-num-lines -yoffset -100 -i -p "

notes "$($rofi_cmd)"
