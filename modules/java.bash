#!/usr/bin/env bash

if $(which jenv >/dev/null); then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

[[ -s /opt/homebrew/opt/jenv/libexec/completions/jenv.bash ]] && source /opt/homebrew/opt/jenv/libexec/completions/jenv.bash 
