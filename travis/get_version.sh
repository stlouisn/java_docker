#!/usr/bin/env bash

set -euo pipefail

# Output java version from ubuntu:rolling repository
echo "$(curl -fsSL --retry 5 --retry-delay 2 https://packages.ubuntu.com/${OS_CODENAME}/openjdk-${DOCKER_TAG}-jre-headless | grep 'Package:' | awk -F '(' {'print $2'})"
