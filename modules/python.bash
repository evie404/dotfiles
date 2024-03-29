#!/usr/bin/env bash

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if $(which pyenv >/dev/null); then
  if [[ $(which pyenv) != *"pyenv-win"* ]]; then
    eval "$(pyenv init --path)"

    eval "$(pyenv init -)"
  fi
fi
