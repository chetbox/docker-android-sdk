FROM ubuntu:14.04
MAINTAINER chetbox

ENV ANDROID_SDK_VERSION_MAJOR=23 \
    ANDROID_SDK_VERSION_MINOR=0 \
    ANDROID_SDK_VERSION_PATCH=2
ENV ANDROID_SDK_VERSION ${ANDROID_SDK_VERSION_MAJOR}.${ANDROID_SDK_VERSION_MINOR}.${ANDROID_SDK_VERSION_PATCH}

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget zip unzip default-jdk libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386
RUN wget -qO- http://dl.google.com/android/android-sdk_r${ANDROID_SDK_VERSION}-linux.tgz | tar -zx -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --all --filter platform-tools,build-tools-${ANDROID_SDK_VERSION},android-${ANDROID_SDK_VERSION_MAJOR},extra-android-support,extra-android-m2repository --no-ui --force

ENV PATH "$PATH:/opt/android-sdk-linux/build-tools/$ANDROID_SDK_VERSION"
ENV ANDROID_HOME /opt/android-sdk-linux/
