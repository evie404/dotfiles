#!/usr/bin/env bash

# export USE_BAZEL_VERSION="0.18.1"
alias bazel="bazelisk"

function qq {
  bazel run //:gazelle $* && bazel test //$*...
}

function qqq {
  bazel run //:gazelle $* && bazel build //$*...
}
