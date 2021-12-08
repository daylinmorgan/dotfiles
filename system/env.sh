# XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

export PATH=$PATH:~/bin

export HISTSIZE=32768;
export HISTFILESIZE="${HISTSIZE}";
export SAVEHIST=4096
export HISTCONTROL=ignoredups:erasedups

export LESS='-R --use-color'

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY

# Disable autocd
unsetopt autocd

# Vim Settings
# export VIMINIT='source $MYVIMRC'
# export MYVIMRC='$DOTFILES_DIR/system/.vimrc'
if is-executable nvim; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi

# spelling correction
# setopt CORRECT
# setopt CORRECT_ALL


# Setup fzf
# ---------
if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}$HOME/.fzf/bin"
fi

if is-executable fzf; then
	source $DOTFILES_DIR/system/fzf.zsh
fi
# ---------

# Add lfcd command
# ----------------
if is-executable lf; then
	source "$XDG_CONFIG_HOME/lf/lfcd.sh"
fi
# ----------------

# nvm settings
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# enhancd
export ENHANCD_DOT_ARG="up"

export STARSHIP_CONFIG=~/.config/starship/config.toml

export EGET_BIN=$HOME/bin

# for dotenv
export ZSH_DOTENV_ALLOWED_LIST=$HOME/.cache/dotenv-allowed.list
export ZSH_DOTENV_DISALLOWED_LIST=$HOME/.cache/dotenv-disallowed.list
