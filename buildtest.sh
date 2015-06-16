#!/usr/bin/env bash

set -e

folder=${1:?usage: $0 folder}

if [ ! -d "$folder" ]; then
    >&2 echo "$folder does not exist"
fi

docker build -t clusterhq/flocker-api-examples:$folder $folder