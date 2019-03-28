#!/usr/bin/env bash

export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

export PATH=${GOPATH}/src/github.com/rickypai/ricky-cli/bazel-bin/darwin_amd64_stripped:$PATH

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi

function qq {
  LOCAL=1 script/gazelle fix $* && bazel test //$*...
}

function qqq {
  LOCAL=1 script/gazelle fix $* && bazel build //$*...
}
