#!/usr/bin/env bash
# Custom tmux new window to apply $WORK_DIR for all commands
tnw() {
	tmux new-window -c "$WORK_DIR" "$@"
}

tsk() {
	tmux send-keys "$@"
}
