#!/usr/bin/env bash

export NVM_DIR="$HOME/.nvm"

if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  source "/usr/local/opt/nvm/nvm.sh"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export PATH=~/node_modules/.bin:$PATH

if $(which yarn >/dev/null); then
  export PATH="$PATH:$(yarn global bin)"
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
*":$PNPM_HOME:"*) ;;
*) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
