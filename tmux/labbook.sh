#!/usr/bin/env bash
CURDIR="$(dirname "$(readlink -f "$0")")"
source "$CURDIR/tmux-functions.sh"

# Set Session Name
SESSION="labbook"
WORK_DIR="$HOME/$SESSION"

if ! [[ -d "$WORK_DIR" ]]; then
	echo "expected to find $WORK_DIR but didn't"
	exit 1
fi

#  Only create tmux session if it doesn't already exist
if ! tmux list-sessions | grep $SESSION; then
	# Start New Session with our name
	tmux new-session -d -s $SESSION -c "$HOME/labbook"

	# Name first Pane and start zsh
	tmux rename-window -t $SESSION:0 'shell'
	tmux send-keys -t 'Main'

	# Create and setup pane for sphinx
	tnw -t $SESSION:1 -n 'sphinx'
	tsk -t 'sphinx' 'source ./.venv/bin/activate' Enter
	tsk -t 'sphinx' 'make live' Enter

	# setup writing window
	tnw -t $SESSION:2 -n 'writing'
	tsk -t 'writing' "nvim ./now.md" Enter
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
