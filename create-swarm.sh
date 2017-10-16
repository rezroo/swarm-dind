#!/bin/bash -e

docker swarm init
SWARM_TOKEN=$(docker swarm join-token -q worker)
echo "SWARM_TOKEN=${SWARM_TOKEN}" >> variables.txt
SWARM_MASTER=$(docker info --format "{{.Swarm.NodeAddr}}")
echo "SWARM_MASTER=${SWARM_MASTER}" >> variables.txt
