FROM java:openjdk-8-jdk-alpine

RUN apk update && apk add unzip bash git ca-certificates && rm -rf /var/cache/apk/* 

ENV ACTIVATOR_VER 1.3.10

RUN mkdir /opt \
 && cd /opt \
 && wget http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VER}/typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && unzip typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && ln -s /opt/activator-${ACTIVATOR_VER}-minimal /opt/activator \
 && rm -f /opt/typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && chmod -R 775 /opt/activator/bin/

ENV PATH=$PATH:/opt/activator/bin

VOLUME /src
WORKDIR /src

EXPOSE 8888

