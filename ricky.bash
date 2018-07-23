#!/usr/bin/env bash

if $(which git >/dev/null); then
  complete -o default -W "\$(git branch 2>/dev/null | cut -c 3-)" git
fi

if $(which brew >/dev/null); then
  for filename in $(brew --prefix)/etc/bash_completion.d/*; do
    . ${filename}
  done

  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi

  if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.bash.inc
  fi

  if [ -f $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc ]; then
    . $(brew --prefix)/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.bash.inc
  fi
fi

# twig
[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash

eval "$(ssh-agent -s)"
ssh-add -K ~/.ssh/id_rsa

export PROJECTS_DIR="${HOME}/workspace"

export WORKSPACE=$PROJECTS_DIR

if [ -f ${WORKSPACE}/dotfiles-work/work.bash ]; then
  source "${WORKSPACE}/dotfiles-work/work.bash"
fi

if [ -f ${WORKSPACE}/dotfiles/sekrets.bash ]; then
  source "${WORKSPACE}/dotfiles/sekrets.bash"
fi

# source /usr/local/share/git-core/git-prompt.sh
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] \$\[\033[00m\] '

# Ruby
if [ ! -f ~/.gemrc ]; then
  echo 'gem: --no-document' > ~/.gemrc
fi

if $(which rbenv >/dev/null); then
  eval "$(rbenv init -)"
fi

export GEM_EDITOR="code"
export BUNDLER_EDITOR="code"
export RUBY_CONFIGURE_OPTS="--disable-install-doc --enable-shared"
export RUBY_GC_HEAP_INIT_SLOTS=600000
export RUBY_GC_HEAP_FREE_SLOTS=600000
export RUBY_GC_HEAP_GROWTH_FACTOR=1.25
export RUBY_GC_HEAP_GROWTH_MAX_SLOTS=300000

alias bundl="bundle"
alias budnle="bundle"

# Kubernetes
if $(which kubectl >/dev/null); then
  source <(kubectl completion bash)
fi

# Use currently compiled version of kubectl
export PATH=${GOPATH}/src/k8s.io/kubernetes/_output/bin:$PATH

# GO
export PATH="$HOME/go/bin/:$PATH" # custom installation location
export GOPATH="${PROJECTS_DIR}"
export PATH=${GOPATH//://bin:}/bin:$PATH

if $(which goenv >/dev/null); then
  eval "$(goenv init -)"
fi

# Android
export ANDROID_NDK_HOME="/usr/local/share/android-ndk" # installed from brew cask
export ANDROID_HOME="$HOME/Library/Android/sdk"

# Docker
# export MACHINE_DRIVER="virtualbox"
# eval "$(docker-machine env default)"

# FUCK JAVASCRIPT
export PATH=~/node_modules/.bin:$PATH

# Java
if $(which jenv >/dev/null); then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Terraform
alias tf="terraform"

# etcd
export ETCDCTL_API=3

# git
# git config --global user.name "Ricky Pai"
# git config --global user.email "rickyp999+github@gmail.com"

git config --global core.excludesfile '~/workspace/dotfiles/.gitignore_global'

alias it="git"
alias gir="git"
git config --global alias.comit commit
git config --global alias.commmit commit
git config --global alias.commti commit
git config --global alias.comimt commit
git config --global alias.stuats status
git config --global alias.stuatt status
git config --global alias.stauts status
git config --global alias.statu status
git config --global alias.staus status
git config --global alias.checout checkout
git config --global alias.cehckout checkout
git config --global alias.chekcout checkout
git config --global alias.checkot checkout
git config --global alias.checkotu checkout
git config --global alias.hceckout checkout
git config --global alias.hcekcout checkout
git config --global alias.chektou checkout
git config --global alias.chekout checkout
git config --global alias.clena clean
git config --global alias.brnahc branch
git config --global alias.lgo log

alias gi="git"
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
git config --global alias.tchecout checkout
git config --global alias.tcehckout checkout
git config --global alias.tchekcout checkout
git config --global alias.tcheckot checkout
git config --global alias.tcheckotu checkout
git config --global alias.thceckout checkout
git config --global alias.thcekcout checkout
git config --global alias.tchektou checkout
git config --global alias.tchekout checkout
git config --global alias.tbrnahc branch
git config --global alias.tpush push
git config --global alias.tlgo log

alias gits="git"
git config --global alias.tatus status

git config --global alias.psuh push
git config --global alias.ocmmit commit
git config --global alias.upsh push

alias gitp="git"
git config --global alias.ush push

alias tiwg="twig"

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

function ggc {
  git gc
  git repack -Ad      # kills in-pack garbage
  git prune           # kills loose garbage
}

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

function gm {
  git checkout $(git_master_branch_name)
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
  cd ${PROJECTS_DIR}
}

function cosite {
  cd "${PROJECTS_DIR}/cosite"
}

function tourgen {
  cd "${PROJECTS_DIR}/tourgenerator"
}

function dotfiles {
  cd "${PROJECTS_DIR}/dotfiles"
}

function mm {
  umas
  git merge master --no-edit
}

function rmas {
  umas
  git rebase $(git_master_branch_name)
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

function curl_time {
  curl -o /dev/null -s -w %{http_code}:%{time_total}\\n $*
}

function zs {
  if [ -f zeus-test-only.json ]
  then
    zeus --config zeus-test-only.json start
  else
    zeus start
  fi
}

function zr {
  zeus rspec $*
}

function lol {
  echo 'lol' >> README.md
  git commit -am 'lol'
  git push -f
}

function nodes {
  if [ "$*" = "--watch" ]; then
    watch -- kubectl get nodes --label-columns='chef-role,failure-domain.beta.kubernetes.io/zone' --sort-by='.metadata.labels.chef-role' -o=wide
  else
    kubectl get nodes --label-columns='chef-role,failure-domain.beta.kubernetes.io/zone' --sort-by='.metadata.labels.chef-role' -o=wide
  fi
}

function pods {
  kubectl get pods --all-namespaces -o=wide
}

function up {
  git fetch upstream
  git merge upstream/master
}

function pod {
  pod_name=$1
}

function kubectl_exec {
  if [ -z "$pod_name" ]
  then
    kubectl exec -it $pod_name -- bash -l
  else
    kubectl exec -it $1 -- bash -l
  fi
}

function kubectl_describe_pod {
  if [ -z "$pod_name" ]
  then
    kubectl describe pod/$pod_name
  else
    kubectl describe pod/$1
  fi
}

function kubectl_logs_previous {
  kubectl logs $pod_name --previous
}

function yaml2json {
  ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))' < $1 > $2
}

function json2yaml {
  ruby -ryaml -rjson -e 'puts JSON.parse(ARGF.read).to_yaml' < $1 > $2
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
    twig diff-branch master
    twig rebase
  else
    twig diff-branch master --branch=$1
  fi
}

function issue {
  twig issue $1
}
