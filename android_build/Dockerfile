FROM gradle:5.4.1-jdk8

USER root
ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=28 \
    ANDROID_BUILD_TOOLS_VERSION=28.0.3 \
    DISTRO=stretch \
    NODEREPO="node_10.x" \
    RUBY_VERSION="2.4.0"

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

# Install Build Essentials
RUN apt-get update && apt-get install build-essential -y && apt-get install file -y && apt-get install apt-utils -y \
    && apt-get install apt-transport-https ca-certificates sudo -y

# Install rubygems
RUN apt-get install rubygems -y \
    && apt-get install ruby-dev -y

# Install and Load RVM
RUN curl -sSL https://get.rvm.io | bash
RUN echo "source ~/.rvm/scripts/rvm" >> $HOME_DIR/.profile
RUN /usr/local/rvm/bin/rvm install $RUBY_VERSION --default

# Install Node and Yarn
RUN curl -sS https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && echo "deb https://deb.nodesource.com/${NODEREPO} ${DISTRO} main" > /etc/apt/sources.list.d/nodesource.list \
    && echo "deb-src https://deb.nodesource.com/${NODEREPO} ${DISTRO} main" >> /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install gcc g++ make -y \
    && apt-get install nodejs -y \
    && apt-get install yarn -y
