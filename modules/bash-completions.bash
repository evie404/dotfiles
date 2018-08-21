#!/usr/bin/env bash

if $(which git >/dev/null); then
  complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git
fi

if $(which brew >/dev/null); then
  for filename in $(brew --prefix)/etc/bash_completion.d/*; do
    . ${filename}
  done

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
  fi

  if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
  fi
fi

# twig
[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash
