#!/bin/bash -e

[ -z "$REG_PORT" ] && REG_PORT=4000

docker run -d --restart=always -p ${REG_PORT}:5000 --name v2_mirror \
  -v "$PWD"/rdata:/var/lib/registry \
  -e REGISTRY_PROXY_REMOTEURL=https://registry-1.docker.io \
  registry:2.5

echo "REGISTRY_PORT=${REG_PORT}" > variables.txt
