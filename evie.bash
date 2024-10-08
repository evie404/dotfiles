#!/usr/bin/env bash

[[ -s /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

function reload() {
  ${BASH_SOURCE[0]}
}

export PATH="$HOME/bin:$HOME/.local/bin:$PATH"
export EDITOR="vi"
export GPG_TTY=$(tty)
export BASH_SILENCE_DEPRECATION_WARNING=1

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"
MODULES_DIR="${CURRENT_DIR}/modules"

# directory helpers and vars loaded first since other things might depend on it
[[ -s ${MODULES_DIR}/dirs.bash ]] && source ${MODULES_DIR}/dirs.bash

eval "$(ssh-agent -s)" >/dev/null

# ssh-add
[[ -s ~/.ssh/id_ed25519_github ]] && ssh-add ~/.ssh/id_ed25519_github

[[ -s ${MODULES_DIR}/android.bash ]] && source ${MODULES_DIR}/android.bash
[[ -s ${MODULES_DIR}/bash-completions.bash ]] && source ${MODULES_DIR}/bash-completions.bash
[[ -s ${MODULES_DIR}/bazel.bash ]] && source ${MODULES_DIR}/bazel.bash
[[ -s ${MODULES_DIR}/colors.bash ]] && source ${MODULES_DIR}/colors.bash
[[ -s ${MODULES_DIR}/docker.bash ]] && source ${MODULES_DIR}/docker.bash
[[ -s ${MODULES_DIR}/etcd.bash ]] && source ${MODULES_DIR}/etcd.bash
[[ -s ${MODULES_DIR}/graphviz.bash ]] && source ${MODULES_DIR}/graphviz.bash
[[ -s ${MODULES_DIR}/golang.bash ]] && source ${MODULES_DIR}/golang.bash
[[ -s ${MODULES_DIR}/java.bash ]] && source ${MODULES_DIR}/java.bash
[[ -s ${MODULES_DIR}/javascript.bash ]] && source ${MODULES_DIR}/javascript.bash
[[ -s ${MODULES_DIR}/kubernetes.bash ]] && source ${MODULES_DIR}/kubernetes.bash
[[ -s ${MODULES_DIR}/python.bash ]] && source ${MODULES_DIR}/python.bash
[[ -s ${MODULES_DIR}/ruby.bash ]] && source ${MODULES_DIR}/ruby.bash
[[ -s ${MODULES_DIR}/rust.bash ]] && source ${MODULES_DIR}/rust.bash
[[ -s ${MODULES_DIR}/terraform.bash ]] && source ${MODULES_DIR}/terraform.bash
[[ -s ${MODULES_DIR}/wsl.bash ]] && source ${MODULES_DIR}/wsl.bash

# sekrets are not tracked in git since they are sekrets
[[ -s ${MODULES_DIR}/sekrets.bash ]] && source ${MODULES_DIR}/sekrets.bash

# git
[[ -s ${MODULES_DIR}/git/config.bash ]] && source ${MODULES_DIR}/git/config.bash
[[ -s ${MODULES_DIR}/git/aliases.bash ]] && source ${MODULES_DIR}/git/aliases.bash
[[ -s ${MODULES_DIR}/git/helpers.bash ]] && source ${MODULES_DIR}/git/helpers.bash

[[ -s ${MODULES_DIR}/completions/bazel.bash ]] && source ${MODULES_DIR}/completions/bazel.bash

# work-related stuff lives in a separate private git repo
[[ -s ${WORKSPACE}/dotfiles-work/work.bash ]] && source ${WORKSPACE}/dotfiles-work/work.bash

if $(which xdg-open >/dev/null); then
  alias open="xdg-open"
fi

if $(uname -a | grep Linux >/dev/null); then
  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'
fi

# edit the content in this directory
function edit-bash() {
  code ${CURRENT_DIR}
}

# runs a simple HTTP file server against current directory
function serveshit() {
  python -m SimpleHTTPServer
}

# runs a command 5 times.
# example: `5times echo hi`
function 5times() {
  for i in {1..5}; do
    $*
  done
}

# runs a command 10 times.
# example: `10 times echo hi`
function 10times() {
  for i in {1..10}; do
    $*
  done
}

# curls an endpoint, gives back '<http code>:<total time>' format. useful for quickly checking
# status code and latency.
function curl_time() {
  curl -o /dev/null -s -w %{http_code}:%{time_total}\\n $*
}

# converts yaml to json.
# usage: `yaml2json <input file> <output file>`
function yaml2json() {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' <$1 >$2
}

# converts json to yaml.
# usage: `json2yaml <input file> <output file>`
function json2yaml() {
  ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml' <$1 >$2
}
