#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

[[ -s ${CURRENT_DIR}/bash-completions.bash ]] && source ${CURRENT_DIR}/bash-completions.bash
[[ -s ${CURRENT_DIR}/kubernetes.bash ]] && source ${CURRENT_DIR}/kubernetes.bash

eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

if [ -f ${WORKSPACE}/dotfiles-work/work.bash ]; then
  source "${WORKSPACE}/dotfiles-work/work.bash"
fi

if [ -f ${CURRENT_DIR}/sekrets.bash ]; then
  source "${CURRENT_DIR}/sekrets.bash"
fi

# source /usr/local/share/git-core/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Ruby
[[ -s ${CURRENT_DIR}/ruby.bash ]] && source ${CURRENT_DIR}/ruby.bash

# GO
export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi

# Android
export ANDROID_NDK_HOME="/usr/local/share/android-ndk" # installed from brew cask
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Docker
# export MACHINE_DRIVER="virtualbox"
# eval "$(docker-machine env default)"

# FUCK JAVASCRIPT
export PATH=~/node_modules/.bin:$PATH

# Java
if $(which jenv >/dev/null); then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Terraform
alias tf="terraform"

# etcd
export ETCDCTL_API=3

# git
[[ -s ${CURRENT_DIR}/git/config.bash ]] && source ${CURRENT_DIR}/git/config.bash
[[ -s ${CURRENT_DIR}/git/aliases.bash ]] && source ${CURRENT_DIR}/git/aliases.bash
[[ -s ${CURRENT_DIR}/git/helpers.bash ]] && source ${CURRENT_DIR}/git/helpers.bash

alias tiwg="twig"

function edit-bash {
  code ${CURRENT_DIR}
}

function tw {
  twig
}

function testint {
  umas
  git branch -D test_int
  git checkout -b test_int
  git merge $(git_master_branch_name) --no-edit
  git checkout -
  git branch -D test_int
}

function serveshit {
  python -m SimpleHTTPServer
}

function 5times {
  for i in {1..5}
    do $*
  done
}

function 10times {
  for i in {1..10}
    do $*
  done
}

function curl_time {
  curl -o /dev/null -s -w %{http_code}:%{time_total}\\n $*
}

function yaml2json {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' < $1 > $2
}

function json2yaml {
  ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml' < $1 > $2
}
