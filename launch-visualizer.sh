#!/bin/bash -e

docker run --rm -it -d --name swarm_visualizer \
  -p 8080:8080 -e HOST=localhost \
  -v /var/run/docker.sock:/var/run/docker.sock \
  dockersamples/visualizer

