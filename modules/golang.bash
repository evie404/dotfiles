#!/usr/bin/env bash
# shellcheck disable=SC1091

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.gvm/scripts/completion" ]] && source "$HOME/.gvm/scripts/completion"

if command -v goenv >/dev/null 2>&1; then
	eval "$(goenv init -)"
fi

function evie-cli() {
	(cd ~/workspace/evie-cli && go run ./...)
}
