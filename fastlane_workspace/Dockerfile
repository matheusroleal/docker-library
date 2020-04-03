FROM ubuntu:18.04

USER root
ENV RUBY_VERSION="2.4.0"

# Install Build Essentials
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
    build-essential \
    file \
    apt-utils \ 
    apt-transport-https \
    ca-certificates \
    sudo \
    gnupg2 \
    wget \
    zip \
    curl \
    git \
    locales \
    bash

# Install rubygems
RUN apt-get install rubygems -y \
    && apt-get install ruby-dev -y

# Install and Load RVM
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - && curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN echo "source ~/.rvm/scripts/rvm" >> $HOME_DIR/.profile

RUN /usr/local/rvm/bin/rvm requirements

ENV PATH="${PATH}:/usr/local/rvm/bin"

RUN locale-gen en_US.UTF-8

ENV LANG="en_US.UTF-88" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"