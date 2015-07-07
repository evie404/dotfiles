complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# source /usr/local/share/git-core/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# source /usr/local/share/git-core/git-prompt.sh
# PS1="[\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]\u\[\033[32m\]$ \[\\033[0m\]"

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

function gcp {
  git cherry-pick $1
}

function gl {
  if [ -z "$*" ]
  then
    git log master.. --oneline
  else
    git log $1 --oneline
  fi
}

function gs {
  git show $1
}

function grc {
  git add .
  git rebase --continue
}

function grbc {
  grc
}

function gp {
  git pull
}

function gpom {
  git pull origin master
}

function gf {
  git fetch
}

function gb {
  git blame $*
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

function cosite {
  cd ~/workspace/cosite
}

function tourgen {
  cd ~/workspace/tourgenerator
}

function dotfiles {
  cd ~/.dotfiles
}

function mm {
  umas
  git merge master --no-edit
}

function rmas {
  umas
  git rebase master
}

function umas {
  git checkout master
  gpom
  git checkout -
}

function serveshit {
  python -m SimpleHTTPServer
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
  zeus rspec $*
}

function up {
  git fetch upstream
  git merge upstream/master
}
