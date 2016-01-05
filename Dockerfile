FROM ubuntu:14.04
MAINTAINER chetbox

RUN dpkg --add-architecture i386
RUN apt-get update && apt-get -y install wget zip unzip default-jdk xmlstarlet libc6:i386 libncurses5:i386 libstdc++6:i386 zlib1g:i386
RUN wget -qO- http://dl.google.com/android/android-sdk_r24.3.4-linux.tgz | tar -zx -C /opt/
RUN echo y | /opt/android-sdk-linux/tools/android update sdk --all --filter platform-tools,build-tools-23.0.1,android-23,extra-android-support,extra-android-m2repository --no-ui --force

ENV PATH "$PATH:/opt/android-sdk-linux/build-tools/23.0.1"
ENV ANDROID_HOME /opt/android-sdk-linux/
