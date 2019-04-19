#!/usr/bin/env bash

set -euo pipefail

# Platforms to build
architectures="arm arm64 amd64"

for arch in $architectures; do

	DOCKER_BUILDKIT=1 docker build \
	--platform linux/$arch \
	--progress plain \
	--tag "$DOCKER_USERNAME/$DOCKER_NAME:$DOCKER_TAG-$arch" \
	--file docker/Dockerfile.$DOCKER_NAME-$DOCKER_TAG-$arch \
	--pull docker/.

done
