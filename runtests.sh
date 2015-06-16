#!/usr/bin/env bash

set -ex

export TEST_REPO=${TEST_REPO:=https://github.com/binocarlos/test-flocker-cluster.git}

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ ! -d "$DIR/test-flocker-cluster" ]; then
    git clone $TEST_REPO $DIR/test-flocker-cluster
fi

(cd $DIR/test-flocker-cluster && git pull)
(cd $DIR/test-flocker-cluster && make boot)

curl -s \
    --cacert $DIR/test-flocker-cluster/_files/cluster.crt \
    --cert $DIR/test-flocker-cluster/_files/user.crt \
    --key $DIR/test-flocker-cluster/_files/user.key \
    https://172.16.255.250:4523/v1/state/nodes