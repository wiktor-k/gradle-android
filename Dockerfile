FROM openjdk:8-jdk

LABEL maintainer "Wiktor Kwapisiewicz <wiktor@metacode.biz>"

ENV ANDROID_HOME /opt/android-sdk-linux
ENV PATH ${PATH}:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools

RUN \
  dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get install -y --force-yes \
    expect \
    git \
    wget \
    libc6-i386 \
    lib32stdc++6 \
    lib32gcc1 \
    lib32ncurses5 \
    lib32z1 && \
  cd /opt && \
  wget --output-document=android-sdk.tgz --quiet http://dl.google.com/android/android-sdk_r24.1.2-linux.tgz && \
  tar xzf android-sdk.tgz && \
  rm -f android-sdk.tgz && \
  chown -R root.root android-sdk-linux && \
  ( (while sleep 3; do echo "y"; done) | android update sdk --all --no-ui --filter "platform-tools,tools,extra-android-m2repository,build-tools-23.0.1,android-23" ) && \
  apt-get clean && \
  mkdir -p /opt/workspace

WORKDIR /opt/workspace

CMD ["/bin/sh", "-c", "./gradlew build"]
