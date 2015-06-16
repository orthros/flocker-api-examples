#!/usr/bin/env bash

set -ex

export TEST_REPO=${TEST_REPO:=https://github.com/binocarlos/test-flocker-cluster.git}

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -d "$DIR/test-flocker-cluster" ]; then
    git clone $TEST_REPO $DIR/test-flocker-cluster
fi

(cd $DIR/test-flocker-cluster && git pull)