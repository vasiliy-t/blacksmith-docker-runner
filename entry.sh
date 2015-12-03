#!/bin/sh
set -e

if [ ! -d "$REPOSITORY_NAME" ]; then
    mkdir -p $REPOSITORY_NAME
fi

docker run --rm -v `pwd`:/data leanlabs/git-builder:latest -C $REPOSITORY_NAME init
docker run --rm -v `pwd`:/data leanlabs/git-builder:latest -C $REPOSITORY_NAME fetch $REPOSITORY_GIT_HTTP_URL $REF
docker run --rm -v `pwd`:/data leanlabs/git-builder:latest -C $REPOSITORY_NAME checkout $AFTER

docker run --rm -v `pwd`/$REPOSITORY_NAME:`pwd`/$REPOSITORY_NAME -w `pwd`/$REPOSITORY_NAME -v /var/run/docker.sock:/var/run/docker.sock leanlabs/make-builder
