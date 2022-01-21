# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2>/dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"

FZF_COLORS="
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
"
FZF_LAYOUT="
--height=40%
--border=rounded
--margin=0,5,5%
--layout=reverse
"

export FZF_DEFAULT_OPTS=${FZF_COLORS}${FZF_LAYOUT}

export FZF_CTRL_GENERAL="--height=100% --margin=0,0,0"

#adapted from https://github.com/zimfw/fzf/blob/master/init.zsh
if [ -x "$(command -v fd)" ]; then
	export FZF_DEFAULT_COMMAND="command fd --type file --exclude ".git/" --hidden --no-ignore"
	_fzf_compgen_path() {
		command fd --type file --exclude ".git/" --hidden --no-ignore "${1}"
	}
elif [ -x "$(command -v rg)" ]; then
	export FZF_DEFAULT_COMMAND="command rg -uu -g '!.git' --files"
	_fzf_compgen_path() {
		command rg -uu -g '!.git' --files "${1}"
	}
fi

if [ -x "$(command -v bat)" ]; then
	export FZF_CTRL_T_OPTS="
   --preview 'command bat --style numbers --color=always --line-range :500 {}'
   --preview-window up,70%,border-rounded
   ${FZF_CTRL_GENERAL}
   "
fi

export FZF_ALT_C_OPTS="
    --height 60%
    --preview 'lsd --tree --color always --icon always {}'
    --preview-window right,60%,border-rounded
    "

# [[ -v FZF_CTRL_T_COMMAND ]] && && export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}
[[ -z "$FZF_CTRL_T_COMMAND" ]] && export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"

# fix spacing on fzf-tab to show max options
zstyle ':fzf-tab:*' fzf-pad 4
