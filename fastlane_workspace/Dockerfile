FROM ubuntu:18.04

ENV RUBY_VERSION="2.7.0"
ENV RVM_CLIENT_USER="mobile-ios"

USER root

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
    bash \
    rubygems \
    ruby-dev \
    whois

# Configure Locales in Ubuntu
RUN locale-gen en_US.UTF-8

# Install and Load RVM
RUN curl -sSL https://rvm.io/mpapis.asc | gpg2 --import - && curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
RUN curl -sSL https://get.rvm.io | bash -s stable
# RUN echo "source ~/.rvm/scripts/rvm" >> $HOME_DIR/.profile

# RUN /usr/local/rvm/bin/rvm requirements
ENV PATH="${PATH}:/usr/local/rvm/bin"

ENV LANG="en_US.UTF-88" \
    LANGUAGE="en_US.UTF-8" \
    LC_ALL="en_US.UTF-8"

RUN useradd -s /bin/iosmobile -d /home/iosmobile/ -m -p $(mkpasswd "") -G sudo iosmobile

USER iosmobile

# Configuração para versão estipulada do ruby
RUN echo "" | sudo -S /usr/local/rvm/bin/rvm install ruby-$RUBY_VERSION

RUN echo "" | sudo -S /usr/local/rvm/bin/rvm ruby-$RUBY_VERSION do /usr/local/rvm/bin/rvm gemset create $RVM_CLIENT_USER

RUN echo "" | sudo -S /usr/local/rvm/bin/rvm use ruby-$RUBY_VERSION@$RVM_CLIENT_USER

# Comandos para usar versão estipulada do ruby
COPY ./scripts/run.sh /usr/local/bin/run

RUN echo "" | sudo -S chmod 777 /usr/local/bin/run

COPY ./scripts/ios_exec.sh /usr/local/bin/ios_exec

RUN echo "" | sudo -S chmod 777 /usr/local/bin/ios_exec