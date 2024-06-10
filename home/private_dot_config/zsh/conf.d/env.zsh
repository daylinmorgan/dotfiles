#!/usr/bin/env zsh

# export PYTHONPATH="$PYTHONPATH:$(viv m s -p)"
export PYTHONPATH="$PYTHONPATH:$HOME/.local/share/viv"
export VIV_NO_SETUPTOOLS=1
export VIV_RUN_MODE='semi-ephemeral'

export TSM_CONFIG="$XDG_CONFIG_HOME/tsm/config-$(hostname).usu"
