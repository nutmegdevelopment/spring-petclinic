FROM alpine:3.6 AS builder
 
MAINTAINER JDriven <info@jdriven.com>
 
ENV JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    LANG=C.UTF-8 \
    MAVVEN_HOME=/opt/maven \
    PATH=${PATH}:/opt/maven/apache-maven-3.5.2/bin
 
RUN set -ex && \
    apk add --no-cache bash git && \
    wget http://download.java.net/java/jdk9-alpine/archive/181/binaries/jdk-9-ea+181_linux-x64-musl_bin.tar.gz -O jdk.tar.gz && \
    mkdir -p /opt/jdk && \
    tar zxvf jdk.tar.gz -C /opt/jdk --strip-components=1 && \
    rm jdk.tar.gz && \
    rm /opt/jdk/lib/src.zip && \
    wget http://mirrors.whoishostingthis.com/apache/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz -O /tmp/maven.tar.gz && \
    mkdir -p /opt/maven && \
    tar xzvf /tmp/maven.tar.gz -C /opt/maven

EXPOSE 8080

WORKDIR /app

