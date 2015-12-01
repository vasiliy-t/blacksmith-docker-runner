# Blacksmith CI docker runner

For now this is the only available runner for Blacksmith continuous intgration server.

Includes docker v1.9.1 binary, requires access to docker.sock and docker.pid.

This runner is capable of:

1. Cloning target repo

2. Running make builder on repo 

### Usage on local machine

```bash
docker run --rm \
    -v /home:/home \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/run/docker.pid:/var/run/docker.pid \
    -e REPOSITORY_GIT_HTTP_URL=https://yourepourl \
    -e REPOSITORY_NAME=youreponame \
    -e AFTER=commit_to_build \
    leanlabs/blacksmith-docker-runner
```

### Environment variables

**REPOSITORY_GIT_HTTP_URL** - http[s] git repo url

**REPOSITORY_NAME** - actual repository name

**AFTER** - the commit to build
