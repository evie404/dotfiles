#!/usr/bin/env bash

# random functions to help with git operations. requires `twig` and `gitx` for some of them.

# deletes origin then pushes back again. most useful when testing CI systems that don't support
# retries on the same branch.
function repush {
  git push origin --delete `git rev-parse --abbrev-ref HEAD`
  git push
}

# checks out the last branch.
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
  if [ $repo_name = "android" ]; then
     echo "dev"
  else
    echo "master"
  fi
}

# current branch name
function git_current_branch_name {
  git rev-parse --abbrev-ref HEAD
}

# check out master. knows which is the master branch
function gm {
  git checkout $(git_master_branch_name)
}

# create a new branch based on the current branch. uses twig to set diff branch name.
function nb {
  branch_name=$(git_current_branch_name)

  git checkout -b $1 && twig diff-branch ${branch_name}
}

# pretty diff with gitx.
function dif {
  git diff $1 | gitx
}

# diff against HEAD to see current progress. presented with gitx.
function difh {
  git diff HEAD^ | gitx
}

# diff against master with gitx.
function difm {
  git diff $(git_master_branch_name) | gitx
}

# undo last commit but keep the changes. useful when you want to keep the changes but not the commit.
function greset {
  git reset --soft HEAD^
}

# shortcut for cherry-picks. supports flag-usage like `gcp --abort` and `gcp --continue`.
function gcp {
  git cherry-pick $1
}

# oneline git log against master or of the branch if specified `gl <branch name>`.
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

# add all tracked files and continue rebase
function grbc {
  git add -u
  git rebase --continue
}

function gp {
  git pull
}

# git pull origin master but knows what master bracnch name is
function gpom {
  git pull origin $(git_master_branch_name)
}

function gf {
  git fetch
}

function gb {
  git blame $*
}

# merges master
function mm {
  umas
  git merge $(git_master_branch_name) --no-edit
}

# rebase master
function rmas {
  umas
  git rebase $(git_master_branch_name)
}

# updates master to origin
function umas {
  git checkout $(git_master_branch_name)
  gpom
  git checkout -
}

# show stash of a particular number. eg: `ss 1`
function ss {
  if [ -z "$*" ]
  then
    git stash show -p stash@{0} | gitx
  else
    git stash show -p stash@{$1} | gitx
  fi
}

# drop stash of a particular number. eg: `sd 1`
function sd {
  if [ -z "$*" ]
  then
    git stash drop stash@{0}
  else
    git stash drop stash@{$1}
  fi
}

# pop stash of a particular number. eg: `sd 1`
function sp {
  if [ -z "$*" ]
  then
    git stash pop stash@{0}
  else
    git stash pop stash@{$1}
  fi
}

# list all stashes
function sl {
  git stash list
}

# commit current changes and name it as "progress". for the lazy.
function progress {
  git commit -am 'progress'
}

# makes a trivial file change and force push to origin. mostly used for triggering and testing CIs.
function lol {
  echo 'lol' >> README.md
  git commit -am 'lol'
  git push -f
}

# updates current branch with upstream/master for syncing upstream forks.
function up {
  git fetch upstream
  git merge upstream/master
}

# rebase current branch and every child branches defined by twig.
function twig-rebase-stack {
  twig checkout-child --all 2> /dev/null
  while [ $? -eq 0 ]; do
    twig rebase && twig checkout-child --all 2> /dev/null
  done

  echo "\nDone rebasing branch stack."
}

# set a branch as the twig diff branch and rebase it.
function diffb {
  twig diff-branch $1
  twig rebase
}

# set master as the twig diff branch and rebase it.
# if argument is give, set's that branch's diff branch as master.
function diffm {
  if [ -z "$*" ]
  then
    twig diff-branch $(git_master_branch_name)
    twig rebase
  else
    twig diff-branch $(git_master_branch_name) --branch=$1
  fi
}

# sets twig issue for branch. eg: `twig issue 1234`.
function issue {
  twig issue $1
}

# see if branch is mergable with master
function testint {
  umas
  git branch -D test_int
  git checkout -b test_int
  git merge $(git_master_branch_name) --no-edit
  git checkout -
  git branch -D test_int
}
