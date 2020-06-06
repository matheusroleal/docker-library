FROM openjdk:8-jdk-alpine

# Enviromental Variables Related to the System
ENV GRADLE_VERSION=3.2 \
    SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    DISTRO=stretch

# Enviromental Variables Related to the Code to be Used in it
ENV ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=28.0.3 \
    NODEREPO="node_10.x" \
    RUBY_VERSION="2.4.0"

# Install Supporting Libs
RUN apk update \
    && apk add \
    autoconf bison bzip2 bzip2-dev ca-certificates coreutils dpkg-dev dpkg \
    gcc gdbm-dev glib-dev libc-dev libffi-dev libxml2-dev libxslt-dev \
    linux-headers make ncurses-dev openssl openssl-dev procps readline-dev\
    ruby tar xz yaml-dev zlib zlib-dev bash curl ruby-dev build-base \
    libstdc++ alpine-sdk gnupg musl-dev shadow

# Get Gradle
RUN curl https://downloads.gradle.org/distributions/gradle-${GRADLE_VERSION}-bin.zip > gradle.zip; \
    unzip gradle.zip; \
    rm gradle.zip;

ENV PATH=${PATH}:/gradle-${GRADLE_VERSION}/bin

RUN mkdir -p /work
RUN mkdir -p /GRADLE_CACHE

# Gradle Work Directory
VOLUME work

# Gradle Cache Directory
VOLUME GRADLE_CACHE

WORKDIR /work

# Download Android SDK
RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && mkdir "$ANDROID_HOME/licenses" || true \
    && echo "24333f8a63b6825ea9c5514f83c2829b004d1fee" > "$ANDROID_HOME/licenses/android-sdk-license"

# Install Android Build Tool and Libraries
RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

# Install Ruby
RUN apk update \
    && apk add \
    ruby \
    ruby-io-console \
    ruby-bundler

# Install and Load RVM
RUN curl -sSL https://github.com/rvm/rvm/tarball/stable -o rvm-stable.tar.gz \
    && echo 'export rvm_prefix="$HOME"' > /root/.rvmrc \
    && echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc \
    && mkdir rvm && cd rvm \
    && tar --strip-components=1 -xzf ../rvm-stable.tar.gz \
    && ./install --auto-dotfiles --autolibs=0

# Script to Select RVM in Case of Running The Image in a Non Interactive Way
COPY ./scripts/rvm-run.sh /usr/local/bin/rvm-run

# Install Node and Yarn
RUN apk update \
    && apk add nodejs \
    npm \
    yarn

# Cleaning APK Cache 
RUN rm -rf /var/cache/apk/*

# Installing Fastlane
RUN gem install fastlane -NV

WORKDIR /work