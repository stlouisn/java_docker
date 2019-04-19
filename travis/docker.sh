#!/usr/bin/env bash

set -euo pipefail

# Enable docker experimental and buildkit mdoes
echo '{"experimental":true,"features":{"buildkit":true}}' | tee /etc/docker/daemon.json

# Restart docker service
service docker restart

# Display docker information
docker info
docker version
