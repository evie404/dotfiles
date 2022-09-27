#!/usr/bin/env bash

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
[[ -s "$HOME/.gvm/scripts/completion" ]] && source "$HOME/.gvm/scripts/completion"

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi

function evie-cli() {
  go run ~/workspace/evie-cli/main.go
}
