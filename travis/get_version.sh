#!/usr/bin/env bash

set -euo pipefail

# Output java version from zulu:github releases
echo "$(curl -fssL --retry 5 --retry-delay 2 https://github.com/zulu-openjdk/zulu-openjdk/tree/master/${DOCKER_TAG}-latest | grep '<code>8</code>' | awk -F '>' {'print $4'} | awk -F '<' {'print $1'})"
