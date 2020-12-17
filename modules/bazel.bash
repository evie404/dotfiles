#!/usr/bin/env bash

# export USE_BAZEL_VERSION="0.18.1"
alias bazel="bazelisk"

export PATH="$HOME/workspace/bazel-watcher/bazel-bin/ibazel/linux_amd64_pure_stripped/:$PATH"
export PATH="$HOME/workspace/bazel-watcher/bazel-bin/ibazel/darwin_amd64_pure_stripped/:$PATH"

function qq {
  # directory
  dir=$1

  # assume rest of the arguments are flags for bazel
  shift

  bazel run //:gazelle -- $dir
  bazel test //$dir... ${@}
}

function qqq {
  # directory
  dir=$1

  # assume rest of the arguments are flags for bazel
  shift

  bazel run //:gazelle -- $dir
  bazel build //$dir... ${@}
}
