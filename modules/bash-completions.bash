#!/usr/bin/env bash

if command -v git >/dev/null 2>&1; then
	complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git
fi

if command -v brew >/dev/null 2>&1; then
	for filename in "$(brew --prefix)/etc/bash_completion.d"/*; do
		# shellcheck source=/dev/null
		. "${filename}"
	done

	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
		# shellcheck source=/dev/null
		. "$(brew --prefix)/etc/bash_completion"
	fi
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		# shellcheck source=/dev/null
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		# shellcheck source=/dev/null
		. /etc/bash_completion
	fi
fi
