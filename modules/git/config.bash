#!/usr/bin/env bash

# git prompt
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# global git configs. mostly to globally ignore filesystem files

# git config --global user.name "Ricky Pai"
# git config --global user.email "rickyp999+github@gmail.com"

git config --global core.excludesfile '~/workspace/dotfiles/.gitignore_global'
