#!/usr/bin/env bash

pkill hypridle
hypridle &

pkill kanshi
kanshi &

kill $(pgrep --full 'hyprman swww')

hyprman swww &

pkill eww # started by hyprman start
hyprman start &
