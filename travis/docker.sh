#!/usr/bin/env bash

set -euo pipefail

# Enable docker experimental and buildkit mdoes
export DOCKER_BUILDKIT=1

# Display docker information
docker info
docker version
