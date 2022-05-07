FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  build-essential \
  checkinstall \
  cmake \
  git \
  g++ \
  openssl \
  libace-dev \
  libmysqlclient-dev \
  libssl-dev \
  libtbb-dev \
  zlib1g-dev \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/vmangos
RUN mkdir -p /root/vmangos/src
RUN mkdir -p /root/vmangos/docker-build
RUN mkdir -p /root/vmangos/build
RUN mkdir -p /root/vmangos/out

WORKDIR /root/vmangos

COPY . /root/vmangos/docker-build

CMD sh /root/vmangos/docker-build/buildServer.sh
