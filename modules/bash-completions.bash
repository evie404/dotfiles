#!/usr/bin/env bash

if $(which git >/dev/null); then
	complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git
fi

if $(which brew 2>/dev/null); then
	for filename in $(brew --prefix)/etc/bash_completion.d/*; do
		. ${filename}
	done

	if [ -f $(brew --prefix)/etc/bash_completion ]; then
		. $(brew --prefix)/etc/bash_completion
	fi
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
	if [ -f /usr/share/bash-completion/bash_completion ]; then
		. /usr/share/bash-completion/bash_completion
	elif [ -f /etc/bash_completion ]; then
		. /etc/bash_completion
	fi
fi
