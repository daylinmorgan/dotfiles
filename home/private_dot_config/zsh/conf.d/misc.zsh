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


