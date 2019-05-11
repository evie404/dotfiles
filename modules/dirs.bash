#!/usr/bin/env bash

export PROJECTS_DIR="${HOME}/workspace"

export WORKSPACE=$PROJECTS_DIR

function workspace {
  cd ${PROJECTS_DIR}
}

function dotfiles {
  cd ${CURRENT_DIR}/..
}

function rickypai {
  cd $GOPATH/src/github.com/rickypai
}
