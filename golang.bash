#!/usr/bin/env bash

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi
