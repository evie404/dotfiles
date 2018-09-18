#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  source "/usr/local/opt/nvm/nvm.sh"
fi

export PATH=~/node_modules/.bin:$PATH
