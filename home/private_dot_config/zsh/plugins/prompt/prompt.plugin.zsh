#!/usr/bin/env zsh


0=${(%):-%N}
# fpath+="${0:A:h}/functions"
autoload -Uz promptinit && promptinit

if zmodload zsh/terminfo && (( terminfo[colors] >= 256 )); then
  [[ ! -f $ZDOTDIR/themes/.p10k.zsh ]] || source $ZDOTDIR/themes/.p10k.zsh
else
  [[ ! -f $ZDOTDIR/themes/.p10k-ascii.zsh ]] || source $ZDOTDIR/themes/.p10k-ascii.zsh
fi

prompt powerlevel10k

