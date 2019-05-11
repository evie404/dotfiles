#!/usr/bin/env bash

# export USE_BAZEL_VERSION="0.18.1"
alias bazel="bazelisk"

function qq {
  # directory
  dir=$1

  # assume rest of the arguments are flags for bazel
  if [ ${#} -gt 1 ]; then
    shift
  fi

  bazel run //:gazelle $dir && bazel test //$dir... ${@}
}

function qqq {
  # directory
  dir=$1

  # assume rest of the arguments are flags for bazel
  if [ ${#} -gt 1 ]; then
    shift
  fi

  bazel run //:gazelle $dir && bazel build //$dir... ${@}
}
