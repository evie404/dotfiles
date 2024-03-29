#!/usr/bin/env bash

# Git aliases for people who can't spell like me. Fuzzy matches different permutations (typos) of
# common git subcommands.

alias qgit="git"
alias qgi="git"
alias gir="git"
alias gti="git"
alias giot="git"

alias it="git"

function git_aliases() {
  # see if the last of the aliases exists. if it does then don't make aliases
  if [[ $(git config --global alias.upsh) ]]; then
    return 0
  fi

  git config --global alias.comit commit
  git config --global alias.commmit commit
  git config --global alias.commti commit
  git config --global alias.comimt commit
  git config --global alias.stuats status
  git config --global alias.stuatt status
  git config --global alias.stauts status
  git config --global alias.statu status
  git config --global alias.staus status
  git config --global alias.stuat status
  git config --global alias.stastus status
  git config --global alias.checout checkout
  git config --global alias.cehckout checkout
  git config --global alias.chekcout checkout
  git config --global alias.checkot checkout
  git config --global alias.checkotu checkout
  git config --global alias.hceckout checkout
  git config --global alias.hcekcout checkout
  git config --global alias.chektou checkout
  git config --global alias.chekout checkout
  git config --global alias.cehckotu checkout
  git config --global alias.checouyt checkout
  git config --global alias.cheocut checkout
  git config --global alias.cehcout checkout
  git config --global alias.chekotu checkout
  git config --global alias.checklout checkout
  git config --global alias.checkouty checkout
  git config --global alias.hckecout checkout
  git config --global alias.ehckout checkout
  git config --global alias.chckout checkout
  git config --global alias.checkout checkout
  git config --global alias.checkoout checkout
  git config --global alias.heckout checkout
  git config --global alias.cehckoout checkout
  git config --global alias.clena clean
  git config --global alias.brnahc branch
  git config --global alias.puh push
  git config --global alias.lgo log
  git config --global alias.rebaes rebase
  git config --global alias.revase rebase
  git config --global alias.statsh stash
  git config --global alias.stahs stash
  git config --global alias.submodules submodule
  git config --global alias.psuh push
  git config --global alias.ocmmit commit
  git config --global alias.upsh push
}
git_aliases

alias gi="git"
function gi_aliases() {
  # see if the last of the aliases exists. if it does then don't make aliases
  if [[ $(git config --global alias.tsubmodules) ]]; then
    return 0
  fi

  git config --global alias.tstatus status
  git config --global alias.tcommit commit
  git config --global alias.tcomit commit
  git config --global alias.tcommmit commit
  git config --global alias.tcommti commit
  git config --global alias.tcomimt commit
  git config --global alias.tstuats status
  git config --global alias.tstuatt status
  git config --global alias.tstauts status
  git config --global alias.tstatu status
  git config --global alias.tstaus status
  git config --global alias.tstuat status
  git config --global alias.tchecout checkout
  git config --global alias.tcehckout checkout
  git config --global alias.tchekcout checkout
  git config --global alias.tcheckot checkout
  git config --global alias.tcheckotu checkout
  git config --global alias.thceckout checkout
  git config --global alias.thcekcout checkout
  git config --global alias.tchektou checkout
  git config --global alias.tchekout checkout
  git config --global alias.tcehckotu checkout
  git config --global alias.tchecouyt checkout
  git config --global alias.tcheocut checkout
  git config --global alias.tcehcout checkout
  git config --global alias.tchekotu checkout
  git config --global alias.tchecklout checkout
  git config --global alias.tcheckouty checkout
  git config --global alias.thckecout checkout
  git config --global alias.tehckout checkout
  git config --global alias.tchckout checkout
  git config --global alias.tcheckout checkout
  git config --global alias.tcheckoout checkout
  git config --global alias.theckout checkout
  git config --global alias.tcehckoout checkout
  git config --global alias.tbrnahc branch
  git config --global alias.tpush push
  git config --global alias.tpuh push
  git config --global alias.tlgo log
  git config --global alias.trebaes rebase
  git config --global alias.trevase rebase
  git config --global alias.tstatsh stash
  git config --global alias.tstahs stash
  git config --global alias.tsubmodule submodule
  git config --global alias.tsubmodules submodule
}
gi_aliases

alias gits="git"
function gits_aliases() {
  # see if the last of the aliases exists. if it does then don't make aliases
  if [[ $(git config --global alias.taus) ]]; then
    return 0
  fi

  git config --global alias.tatus status
  git config --global alias.tuats status
  git config --global alias.tuatt status
  git config --global alias.tauts status
  git config --global alias.tatu status
  git config --global alias.taus status
}
gits_aliases

alias gitp="git"
function gitp_aliases() {
  # see if the last of the aliases exists. if it does then don't make aliases
  if [[ $(git config --global alias.ush) ]]; then
    return 0
  fi

  git config --global alias.ush push
}
gitp_aliases

alias giut="git"
function giut_aliases() {
  # see if the last of the aliases exists. if it does then don't make aliases
  if [[ $(git config --global alias.puh) ]]; then
    return 0
  fi

  git config --global alias.puh push
}
giut_aliases

# twig aliases

alias tiwg="twig"

function tw() {
  twig
}
