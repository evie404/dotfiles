#!/usr/bin/env bash

# import git prompt script
[[ -s /usr/lib/git-core/git-sh-prompt ]] && source /usr/lib/git-core/git-sh-prompt

# tell bash to show user, directory, and git branch
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# global git configs. mostly to globally ignore filesystem files

# git config --global user.name "Ricky Pai"
# git config --global user.email "rickyp999+github@gmail.com"

git config --global core.excludesfile '~/workspace/dotfiles/.gitignore_global'
git config --global pull.ff only
