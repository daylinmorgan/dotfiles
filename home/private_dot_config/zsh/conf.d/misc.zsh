#
# misc - Set general Zsh config options here, or change plugin settings.
#

#
# Options
#

# Undo options from plugins
setopt NO_BEEP       # Be quiet!
setopt NO_HIST_BEEP  # Be quiet!

#
# OMZ
#
MAGIC_ENTER_GIT_COMMAND="$MAGIC_ENTER_OTHER_COMMAND && git status -sb"

#
# Zsh-Utils
#
# The belek/zsh-utils completion plugin also introduces compstyles. Let's use that!
(( ! $+functions[compstyle_zshzoo_setup] )) || compstyle_zshzoo_setup

# let make handle it's own shell completion
zstyle ':completion::complete:make:*:targets' call-command true



