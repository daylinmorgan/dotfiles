#!/usr/bin/env bash
export PATH="$HOME/bin:$PATH"

is-executable() {
	[ -x "$(command -v "$1")" ]
}

install-cargo-rustup() {
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
}

install-npm() {
	fnm install 'v18.5.0'
}

install-cargo-rustup

if is-executable fnm; then
	install-npm
fi
