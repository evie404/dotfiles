complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git

if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
  . /usr/local/etc/bash_completion.d/git-prompt.sh
fi

# source /usr/local/share/git-core/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

export GEM_EDITOR="subl"

# source /usr/local/share/git-core/git-prompt.sh
# PS1="[\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]\u\[\033[32m\]$ \[\\033[0m\]"

alias it="git"
alias gir="git"
git config --global alias.comit commit
git config --global alias.commmit commit
git config --global alias.commti commit
git config --global alias.stuats status
git config --global alias.stuatt status
git config --global alias.stauts status
git config --global alias.statu status
git config --global alias.checout checkout
git config --global alias.cehckout checkout
git config --global alias.chekcout checkout
git config --global alias.checkot checkout

alias gi="git"
git config --global alias.tstatus status
git config --global alias.tcommit commit
git config --global alias.tcomit commit
git config --global alias.tcommmit commit
git config --global alias.tcommti commit
git config --global alias.tstuats status
git config --global alias.tstuatt status
git config --global alias.tstauts status
git config --global alias.tstatu status
git config --global alias.tchecout checkout
git config --global alias.tcehckout checkout
git config --global alias.tchekcout checkout
git config --global alias.tcheckot checkout

alias tiwg="twig"

function twig-fucking-ron {
  mv .ruby-version .ruby-version.tmp
  rbenv local 2.1.6
  twig
  rm .ruby-version
  mv .ruby-version.tmp .ruby-version
}

function edit-subl {
  subl ~/Library/Application\ Support/Sublime\ Text\ 3
}

function edit-bash {
  subl ~/dotfiles/.ricky.bash
}

function repush {
  git push origin --delete `git rev-parse --abbrev-ref HEAD`
  git push
}

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
  if [ $(basename `pwd`) = "chef" ]; then
     git checkout production
  else
    git checkout master
  fi
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

function ignore_ruby_version {
  echo '.ruby-version' >> .gitignore
  git add .gitignore
  git commit -m 'git ignore .ruby-version'
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

function 10times {
  for i in {1..10}
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

function zs {
  zeus start
}

function zr {
  zeus rspec $*
}

function up {
  git fetch upstream
  git merge upstream/master
}
