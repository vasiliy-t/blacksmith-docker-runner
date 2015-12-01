#!/bin/sh
set -e

docker run --rm -v `pwd`:/data leanlabs/git-builder:latest pull -C $REPOSITORY_NAME || docker run --rm -v `pwd`:/data leanlabs/git-builder:latest clone $REPOSITORY_GIT_HTTP_URL $REPOSITORY_NAME

docker run --rm -v `pwd`/$REPOSITORY_NAME:/data leanlabs/git-builder:latest checkout $AFTER

docker run --rm -v `pwd`/$REPOSITORY_NAME:`pwd`/$REPOSITORY_NAME -w `pwd`/$REPOSITORY_NAME -v /var/run/docker.sock:/var/run/docker.sock -v /var/run/docker.pid:/var/run/docker.pid  leanlabs/make-builder
