#!/usr/bin/env bash

set -euo pipefail

# Platforms to build
architectures="arm arm64 amd64"

for arch in $architectures; do

	docker build \
	--platform=linux/$arch \
    --label org.label-schema.build-date="$BUILD_DATE" \
    --label org.label-schema.build-number="$BUILD_NUMBER" \
    --label org.label-schema.description="$DOCKER_DESCRIPTION" \
    --label org.label-schema.maintainer="$DOCKER_MAINTAINER" \
    --label org.label-schema.name="$DOCKER_NAME" \
    --label org.label-schema.url="$DOCKER_URL" \
    --label org.label-schema.version="$DOCKER_VERSION" \
    --label org.label-schema.schema-version="$SCHEMA_VERSION" \
    --label org.label-schema.vcs-ref="$VCS_REF" \
    --label org.label-schema.vcs-url="$VCS_URL" \
	--tag $DOCKER_USERNAME/$DOCKER_NAME:$DOCKER_TAG-$arch \
	--file docker/Dockerfile.$DOCKER_NAME-$DOCKER_TAG-$arch \
	--pull

done
