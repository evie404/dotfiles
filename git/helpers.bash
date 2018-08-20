#!/usr/bin/env bash

# random functions to help with git operations. requires `twig` for some of them.

function repush {
  git push origin --delete `git rev-parse --abbrev-ref HEAD`
  git push
}

function lb {
  git checkout -
}

# super aggressively performs GC on a repo. only really useful when a large repo becomes slow.
function ggc {
  git gc
  git repack -Ad      # kills in-pack garbage
  git prune           # kills loose garbage
}

# master branch names. useful when the master is not named `master`.
function git_master_branch_name {
  repo_name=$(basename `git rev-parse --show-toplevel`)
  if [ $repo_name = "chef" ]; then
     echo "dev"
  elif [ $repo_name = "chain" ]; then
     echo "main"
  elif [ $repo_name = "android" ]; then
     echo "dev"
  else
    echo "master"
  fi
}

function git_current_branch_name {
  git rev-parse --abbrev-ref HEAD
}

# check out master. knows which is the master branch
function gm {
  git checkout $(git_master_branch_name)
}

function nb {
  branch_name=$(git_current_branch_name)

  git checkout -b $1 && twig diff-branch ${branch_name}
}

function dif {
  git diff $1 | gitx
}

function difh {
  git diff HEAD^ | gitx
}

function difm {
  git diff $(git_master_branch_name) | gitx
}

function greset {
  git reset --soft HEAD^
}

function gcp {
  git cherry-pick $1
}

function gl {
  if [ -z "$*" ]
  then
    git log $(git_master_branch_name).. --oneline
  else
    git log $1 --oneline
  fi
}

function gs {
  git status
}

function grbc {
  git add -u
  git rebase --continue
}

function gp {
  git pull
}

function gpom {
  git pull origin $(git_master_branch_name)
}

function gf {
  git fetch
}

function gb {
  git blame $*
}


function mm {
  umas
  git merge $(git_master_branch_name) --no-edit
}

function rmas {
  umas
  git rebase $(git_master_branch_name)
}

function umas {
  git checkout $(git_master_branch_name)
  gpom
  git checkout -
}


function ss {
  if [ -z "$*" ]
  then
    git stash show -p stash@{0} | gitx
  else
    git stash show -p stash@{$1} | gitx
  fi
}

function sd {
  if [ -z "$*" ]
  then
    git stash drop stash@{0}
  else
    git stash drop stash@{$1}
  fi
}

function sp {
  if [ -z "$*" ]
  then
    git stash pop stash@{0}
  else
    git stash pop stash@{$1}
  fi
}

function sl {
  git stash list
}

function progress {
  git commit -am 'progress'
}

function lol {
  echo 'lol' >> README.md
  git commit -am 'lol'
  git push -f
}

function up {
  git fetch upstream
  git merge upstream/master
}

function twig-rebase-stack {
  twig checkout-child --all 2> /dev/null
  while [ $? -eq 0 ]; do
    twig rebase && twig checkout-child --all 2> /dev/null
  done

  echo "\nDone rebasing branch stack."
}

function diffb {
  twig diff-branch $1
  twig rebase
}

function diffm {
  if [ -z "$*" ]
  then
    twig diff-branch $(git_master_branch_name)
    twig rebase
  else
    twig diff-branch $(git_master_branch_name) --branch=$1
  fi
}

function issue {
  twig issue $1
}
