#!/usr/bin/env bash

set -e

folder=${1:?usage: $0 folder}

if [ ! -d "$folder" ]; then
    >&2 echo "$folder does not exist"
fi

docker run --rm -ti \
    -v /vagrant:/keys \
    -e CONTROL_SERVICE=172.16.255.250 \
    -e KEY_FILE=/keys/user.key \
    -e CERT_FILE=/keys/user.crt \
    -e CA_FILE=/keys/cluster.crt \
    clusterhq/flocker-api-examples:$folder