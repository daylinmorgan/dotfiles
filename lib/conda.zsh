#!/usr/bin/env zsh
# Updated to use $HOME

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/mambaforge/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__conda_setup"
else
	if [ -f "$HOME/mambaforge/etc/profile.d/conda.sh" ]; then
		. "$HOME/mambaforge/etc/profile.d/conda.sh"
	else
		export PATH="$HOME/mambaforge/bin:$PATH"
	fi
fi
unset __conda_setup

if [ -f "$HOME/mambaforge/etc/profile.d/mamba.sh" ]; then
	. "$HOME/mambaforge/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

# ! is-tty && [ -d "$HOME/mambaforge/envs/dev" ] && conda activate dev

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="$HOME/.local/bin/micromamba"
export MAMBA_ROOT_PREFIX="$HOME/micromamba"
__mamba_setup="$("$HOME/.local/bin/micromamba" shell hook --shell zsh --prefix "$HOME/micromamba" 2>/dev/null)"
if [ $? -eq 0 ]; then
	eval "$__mamba_setup"
else
	if [ -f "$HOME/micromamba/etc/profile.d/micromamba.sh" ]; then
		. "$HOME/micromamba/etc/profile.d/micromamba.sh"
	else
		export PATH="$HOME/micromamba/bin:$PATH" # extra space after export prevents interference from conda init
	fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

snake() {
	if [[ $1 == "no" ]]; then
		if [[ $VIRTUAL_ENV != "" ]]; then
			echo "deactivate python virtualenv: $VIRTUAL_ENV"
			deactivate
		elif [[ $CONDA_DEFAULT_ENV != "" ]]; then
			echo "deactivating conda env: $CONDA_DEFAULT_ENV"
			conda deactivate
		else
			echo 'no environment to leave'
		fi
	else
		if [[ -d $(pwd)/env ]]; then
			printf 'activating project-specific env: %s\n' "${PWD##*/}/env"
			conda activate ./env
		elif [[ -d $(pwd)/venv ]]; then
			echo "activating python virtualenv"
			source ./venv/bin/activate
		elif [[ -d $(pwd)/.venv ]]; then
			echo "activating python virtualenv"
			source ./.venv/bin/activate
		else
			echo "is there an environment to activate?"
			echo "I was expecting either a conda(env) or virtualenv(venv,.venv)"
		fi
	fi
}
