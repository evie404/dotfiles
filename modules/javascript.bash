#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  source "/usr/local/opt/nvm/nvm.sh"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=~/node_modules/.bin:$PATH

