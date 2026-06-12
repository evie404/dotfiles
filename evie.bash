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

[[ -s ${MODULES_DIR}/bash-completions.bash ]] && source ${MODULES_DIR}/bash-completions.bash
[[ -s ${MODULES_DIR}/colors.bash ]] && source ${MODULES_DIR}/colors.bash
[[ -s ${MODULES_DIR}/golang.bash ]] && source ${MODULES_DIR}/golang.bash
[[ -s ${MODULES_DIR}/javascript.bash ]] && source ${MODULES_DIR}/javascript.bash
[[ -s ${MODULES_DIR}/python.bash ]] && source ${MODULES_DIR}/python.bash

# sekrets are not tracked in git since they are sekrets
[[ -s ${MODULES_DIR}/sekrets.bash ]] && source ${MODULES_DIR}/sekrets.bash

# git
[[ -s ${MODULES_DIR}/git/config.bash ]] && source ${MODULES_DIR}/git/config.bash
# [[ -s ${MODULES_DIR}/git/aliases.bash ]] && source ${MODULES_DIR}/git/aliases.bash
[[ -s ${MODULES_DIR}/git/helpers.bash ]] && source ${MODULES_DIR}/git/helpers.bash


# work-related stuff lives in a separate private git repo
[[ -s ${WORKSPACE}/dotfiles-work/work.bash ]] && source ${WORKSPACE}/dotfiles-work/work.bash
