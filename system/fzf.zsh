# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "$HOME/.fzf/shell/key-bindings.zsh"


# Configs
export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
	--color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
	--color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
	--color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
	--layout=reverse --info=inline --border=horizontal
	--min-height=25"



#adapted from https://github.com/zimfw/fzf/blob/master/init.zsh
if (( ${+commands[fd]} )); then
   export FZF_DEFAULT_COMMAND="command fd --type file --exclude ".git/" --hidden --no-ignore"
   _fzf_compgen_path() {
     command fd --type file --exclude ".git/" --hidden --no-ignore "${1}"
   }
elif (( ${+commands[rg]} )); then
   export FZF_DEFAULT_COMMAND="command rg -uu -g '!.git' --files"
    _fzf_compgen_path() {
     command rg -uu -g '!.git' --files "${1}"
   }
fi

if (( ${+commands[bat]} )); then
   export FZF_CTRL_T_OPTS="--preview 'command bat --color=always --line-range :500 {}' ${FZF_CTRL_T_OPTS}"
fi

export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

if (( ${+FZF_DEFAULT_COMMAND} )) export FZF_CTRL_T_COMMAND=${FZF_DEFAULT_COMMAND}

# fix spacing on fzf-tab to show max options
zstyle ':fzf-tab:*' fzf-pad 4

