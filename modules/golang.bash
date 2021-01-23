#!/usr/bin/env bash

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi

function ricky-cli() {
  (cd ~/workspace/src/github.com/rickypai/ricky-cli && go run main.go)
}
