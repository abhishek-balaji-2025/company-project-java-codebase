#!/bin/bash
set -e

mkdir -p ~/.docker/cli-plugins/
curl -LO https://github.com/docker/buildx/releases/latest/download/buildx-linux-amd64
chmod +x buildx-linux-amd64
mv buildx-linux-amd64 ~/.docker/cli-plugins/docker-buildx

echo "Docker Buildx installed successfully!"
