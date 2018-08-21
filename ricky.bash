#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

[[ -s ${CURRENT_DIR}/bash-completions.bash ]] && source ${CURRENT_DIR}/bash-completions.bash
[[ -s ${CURRENT_DIR}/kubernetes.bash ]] && source ${CURRENT_DIR}/kubernetes.bash

eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

[[ -s ${WORKSPACE}/dotfiles-work/work.bash ]] && source ${WORKSPACE}/dotfiles-work/work.bash
[[ -s ${CURRENT_DIR}/sekrets.bash ]] && source ${CURRENT_DIR}/sekrets.bash

[[ -s ${CURRENT_DIR}/ruby.bash ]] && source ${CURRENT_DIR}/ruby.bash
[[ -s ${CURRENT_DIR}/golang.bash ]] && source ${CURRENT_DIR}/golang.bash
[[ -s ${CURRENT_DIR}/android.bash ]] && source ${CURRENT_DIR}/android.bash
[[ -s ${CURRENT_DIR}/docker.bash ]] && source ${CURRENT_DIR}/docker.bash
[[ -s ${CURRENT_DIR}/javascript.bash ]] && source ${CURRENT_DIR}/javascript.bash
[[ -s ${CURRENT_DIR}/java.bash ]] && source ${CURRENT_DIR}/java.bash
[[ -s ${CURRENT_DIR}/terraform.bash ]] && source ${CURRENT_DIR}/terraform.bash
[[ -s ${CURRENT_DIR}/etcd.bash ]] && source ${CURRENT_DIR}/etcd.bash

# git
[[ -s ${CURRENT_DIR}/git/config.bash ]] && source ${CURRENT_DIR}/git/config.bash
[[ -s ${CURRENT_DIR}/git/aliases.bash ]] && source ${CURRENT_DIR}/git/aliases.bash
[[ -s ${CURRENT_DIR}/git/helpers.bash ]] && source ${CURRENT_DIR}/git/helpers.bash

# edit the content in this directory
function edit-bash {
  code ${CURRENT_DIR}
}

# runs a simple HTTP file server against current directory
function serveshit {
  python -m SimpleHTTPServer
}

# runs a command 5 times.
# example: `5times echo hi`
function 5times {
  for i in {1..5}
    do $*
  done
}

# runs a command 10 times.
# example: `10 times echo hi`
function 10times {
  for i in {1..10}
    do $*
  done
}

# curls an endpoint, gives back '<http code>:<total time>' format. useful for quickly checking
# status code and latency.
function curl_time {
  curl -o /dev/null -s -w %{http_code}:%{time_total}\\n $*
}

# converts yaml to json.
# usage: `yaml2json <input file> <output file>`
function yaml2json {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' < $1 > $2
}

# converts json to yaml.
# usage: `json2yaml <input file> <output file>`
function json2yaml {
  ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml' < $1 > $2
}
