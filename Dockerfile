FROM leanlabs/base-builder

ENV REPOSITORY_GIT_HTTP_URL="myrepo" \
    REPOSITORY_NAME="reponame" \
    BEFORE="beforecommitid" \
    COMMIT="committobuild" \
    DOCKER_HUB_LOGIN=qwerty \
    DOCKER_HUB_EMAIL=qwerty@qwerty.com \
    DOCKER_HUB_PASSWORD=qwerty

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 /usr/bin/docker
COPY ./entry.sh /entry.sh

RUN chmod +x /usr/bin/docker

CMD ["/bin/sh", "/entry.sh"]
