FROM java:openjdk-8-jdk

RUN apt-get update && apt-get install -y --no-install-recommends unzip bash openssh-client nodejs git ca-certificates fontconfig && rm -rf /var/lib/apt/lists/* 

ENV ACTIVATOR_VER 1.3.10

RUN cd /opt \
 && wget http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VER}/typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && unzip typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && ln -s /opt/activator-${ACTIVATOR_VER}-minimal /opt/activator \
 && rm -f /opt/typesafe-activator-${ACTIVATOR_VER}-minimal.zip \
 && chmod -R 775 /opt/activator/bin/

ENV PATH=$PATH:/opt/activator/bin

RUN activator help || :

ENV PHANTOM_JS phantomjs-2.1.1-linux-x86_64

RUN cd /opt \
 && wget https://bitbucket.org/ariya/phantomjs/downloads/$PHANTOM_JS.tar.bz2 \
 && tar xvjf $PHANTOM_JS.tar.bz2 \
 && mv $PHANTOM_JS /usr/local/share \
 && ln -sf /usr/local/share/$PHANTOM_JS/bin/phantomjs /usr/local/bin

VOLUME /src
WORKDIR /src

EXPOSE 8888
