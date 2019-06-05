#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function ginfo {
  cat $1 | gvpr -f ${CURRENT_DIR}/graphinfo.gvpr
}

function gvpng {
  find *.gv | xargs -I % sh -c 'dot -Tpng % -Gdpi=300 -o $(echo % | sed "s/gv/png/g")'
}

function gvsvg {
  find *.gv | xargs -I % sh -c 'dot -Tsvg % -o $(echo % | sed "s/gv/svg/g")'
}
