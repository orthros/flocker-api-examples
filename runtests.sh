#!/usr/bin/env bash

set -ex

#vagrant up
vagrant ssh node1 -c "cd /vagrant && bash buildtest.sh curl"
vagrant ssh node1 -c "cd /vagrant && bash buildtest.sh go"
vagrant ssh node1 -c "cd /vagrant && bash buildtest.sh python"

curl_output=$(vagrant ssh node1 -c "cd /vagrant && bash runtest.sh curl")
go_output=$(vagrant ssh node1 -c "cd /vagrant && bash runtest.sh go")
python_output=$(vagrant ssh node1 -c "cd /vagrant && bash runtest.sh python")

mkdir -p _output
echo $curl_output > _output/curl.txt
echo $go_output > _output/go.txt
echo $python_output > _output/python.txt