#!/usr/bin/env zsh

CURDIR=${0:a:h}

gen() {
	if is-executable $1; then
		echo "$1 updated"
		"$@" | sed "s#$HOME#\$HOME#g" >$CURDIR/"_$argv[1]"
	else
		echo "skipping $1"
	fi
}

echo "GENERATING COMPLETION SCRIPTS"
echo "-----------------------------"
gen sheldon completions --shell zsh
gen just --completions zsh
gen zellij setup --generate-completion zsh
gen pdm completion zsh

# echo "FETCHING COMPLETION SCRIPTS"
# wget -O _task https://raw.githubusercontent.com/go-task/task/master/completion/zsh/_task
