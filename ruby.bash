#!/usr/bin/env bash

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
