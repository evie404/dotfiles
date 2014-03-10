function rv {
  ruby -v
}

function tw {
  twig
}

function lb {
  git checkout -
}

function gm {
  git checkout master
}

function nb {
  git checkout -b $1
}

function dif {
  git diff $1 | gitx
}

function difh {
  git diff HEAD^ | gitx
}

function difm {
  git diff master | gitx
}

function greset {
  git reset --soft HEAD^
}

function gs {
  git status
}

function gp {
  git pull
}

function testint {
  umas
  git branch -D test_int
  git checkout -b test_int
  git merge master --no-edit
  git checkout -
  git branch -D test_int
}

function workspace {
  cd ~/workspace
}

function rmas {
  umas
  git rebase master
}

function umas {
  git checkout master
  git pull
  git checkout -
}

function 5times {
  for i in {1..5}
    do $*
  done
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

function zr {
  zeus rspec $1
}
