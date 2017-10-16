#!/bin/bash -e

# vars
[ -z "$NUM_WORKERS" ] && NUM_WORKERS=3

source ./variables.txt

# run NUM_WORKERS workers with SWARM_TOKEN
for i in $(seq "${NUM_WORKERS}"); do
  docker run --rm -d --privileged --name "worker-${i}" --hostname="worker-${i}" \
    -p ${i}2375:2375 \
    -p ${i}1000:5000 \
    -p ${i}1001:5001 \
    -p ${i}1601:5601 \
    docker:17.09.0-ce-dind \
      --storage-driver=overlay2 \
      --registry-mirror "http://${SWARM_MASTER}:${REGISTRY_PORT}"
  sleep 5
  docker --host="localhost:${i}2375" swarm join --token "${SWARM_TOKEN}" "${SWARM_MASTER}:2377"
done
