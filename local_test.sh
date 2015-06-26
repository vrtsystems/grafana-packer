#!/bin/bash

docker kill gfbuild
docker rm gfbuild

docker build --tag "vrtsystems/grafanabuild" .

mkdir -p dist

docker run -i -t --name gfbuild \
  -v $(pwd)/dist:/tmp/dist \
  vrtsystems/grafanabuild
