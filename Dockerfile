FROM leanlabs/base-builder

ENV REPOSITORY_GIT_HTTP_URL="myrepo" \
    REPOSITORY_NAME="reponame" \
    BEFORE="beforecommitid" \
    AFTER="aftercommitid"

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 /usr/bin/docker
COPY ./entry.sh /entry.sh

RUN chmod +x /usr/bin/docker

CMD ["/bin/sh", "/entry.sh"]
