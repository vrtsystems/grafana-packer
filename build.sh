#!/bin/bash

# This is ment to run inside this build container

GOPATH=/go
REPO_PATH=$GOPATH/src/github.com/grafana/grafana

mkdir -p /go/src/github.com/grafana
cd /go/src/github.com/grafana

# Get VRT's fork of Grafana so we can include the singlestat image patch
git clone https://github.com/vrtsystems/grafana.git
cd grafana
git checkout singlestat-add-image


# go get -u -v github.com/grafana/grafana

cd $REPO_PATH

go get github.com/tools/godep
go run build.go build

npm install

source /etc/profile.d/rvm.sh
rvm use 1.9.3 --default

gem install fpm

go run build.go package latest

cp dist/* /tmp/dist/


