#!/bin/sh
set -e

# Create empty directory to act on
if [ ! -d "$REPOSITORY_NAME" ]; then
    mkdir -p $REPOSITORY_NAME
fi

# Initialize empty repository
docker run --rm \
    -v `pwd`:/data \
    leanlabs/git-builder:latest \
    -C $REPOSITORY_NAME init

# Fetch git ref to from target repository to act on
docker run --rm \
    -v `pwd`:/data \
    leanlabs/git-builder:latest \
    -C $REPOSITORY_NAME fetch $REPOSITORY_GIT_HTTP_URL $REF

# Checkout commit to act on
docker run --rm \
    -v `pwd`:/data \
    leanlabs/git-builder:latest \
    -C $REPOSITORY_NAME checkout $AFTER

# Start build process
docker run --rm \
    -v `pwd`/$REPOSITORY_NAME:`pwd`/$REPOSITORY_NAME \
    -w `pwd`/$REPOSITORY_NAME \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -e DOCKER_HUB_EMAIL=$DOCKER_HUB_EMAIL \
    -e DOCKER_HUB_LOGIN=$DOCKER_HUB_LOGIN \
    -e DOCKER_HUB_PASSWORD=$DOCKER_HUB_PASSWORD \
    leanlabs/make-builder
