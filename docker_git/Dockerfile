# Uses docker 19.03.1 as base for this new image
FROM docker:19.03.1

# Installing git for Alpine linux
RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    openssh
