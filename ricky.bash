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

function edit-bash {
  code ${CURRENT_DIR}
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
