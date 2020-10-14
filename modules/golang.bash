#!/usr/bin/env bash

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

export PATH=${GOPATH}/src/github.com/rickypai/ricky-cli/bazel-bin/darwin_amd64_stripped:$PATH
export PATH=${GOPATH}/src/github.com/rickypai/ricky-cli/bazel-bin/linux_amd64_stripped:$PATH

[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi
