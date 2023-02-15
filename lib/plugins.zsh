#!/usr/bin/env zsh

PLUGINS_DIR=$DOTFILES_DIR/plugins

source $PLUGINS_DIR/zsh-defer/zsh-defer.plugin.zsh

# TODO: automate collection of plugin files
plugins=(
  base16/base16-shell.plugin.zsh
  fzf-tab/fzf-tab.plugin.zsh
  zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
  oh-my-zsh/clipboard.zsh
  oh-my-zsh/completion.zsh
  oh-my-zsh/dotenv/dotenv.plugin.zsh
  oh-my-zsh/extract/extract.plugin.zsh
)

for plugin in $plugins; do
  zsh-defer source $PLUGINS_DIR/$plugin
done

unset PLUGINS_DIR plugins
