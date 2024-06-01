#
# misc - Set general Zsh config options here, or change plugin settings.
#

# Options
# Undo options from plugins
setopt NO_BEEP       # Be quiet!
setopt NO_HIST_BEEP  # Be quiet!

# OMZ
MAGIC_ENTER_GIT_COMMAND="$MAGIC_ENTER_OTHER_COMMAND && git status -sb"
MAGIC_ENTER_OTHER_COMMAND="ls -l ."

# let make handle it's own shell completion
zstyle ':completion::complete:make:*:targets' call-command true

# fzf-tab completions
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


zstyle ':fzf-tab:complete:cd:*' fzf-preview 'lsd --tree --depth 2 --color always $realpath'
