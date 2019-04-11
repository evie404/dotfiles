#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

function ginfo {
  cat $1 | gvpr -f ${CURRENT_DIR}/graphinfo.gvpr
}
