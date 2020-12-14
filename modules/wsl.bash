#!/usr/bin/env bash

function wsl_host {
  cat /etc/resolv.conf  | grep -v '^#' | grep nameserver | awk '{print $2}'
}

export WSL_HOST=$(wsl_host)
