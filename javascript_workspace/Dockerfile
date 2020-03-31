FROM ubuntu:18.04

USER root

ENV NODE_URL="https://github.com/nodejs/node.git" \
    NODE_VERSION=v13.10.1

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
    git-core \
    curl \
    build-essential \
    openssl \
    libssl-dev \
    wget \
    zip \
    python

RUN git clone $NODE_URL

# Goes to the node file
WORKDIR /node

# Define specific version of Node
RUN git checkout $NODE_VERSION

RUN ./configure && make && make install

# Install NPM
RUN curl -L https://npmjs.org/install.sh | sh

# Install Yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install -y yarn

WORKDIR /home
