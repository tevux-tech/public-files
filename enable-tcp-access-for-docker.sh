#!/bin/bash

set -e
docker run hello-world > /dev/null

sudo echo "{\"hosts\": [\"tcp://0.0.0.0:2375\", \"unix:///var/run/docker.sock\"]}" > /etc/docker/daemon.json
sudo mkdir -p /etc/systemd/system/docker.service.d/
sudo echo -e "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd" > /etc/systemd/system/docker.service.d/override.conf
sudo systemctl daemon-reload
sudo systemctl restart docker.service

