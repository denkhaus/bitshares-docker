FROM ubuntu:16.04
LABEL maintainer "denkhaus"


ARG TAG
ARG BUILD_TYPE

RUN apt-get update -y
RUN apt-get install -y wget gcc g++ make automake autoconf cmake git \
	libtool openssl libboost-all-dev libssl-dev libcurl4-openssl-dev \
	libreadline-dev libncurses5-dev

RUN git clone https://github.com/bitshares/bitshares-core.git /bitshares
WORKDIR /bitshares

RUN git checkout $TAG && git submodule update --init --recursive

RUN cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE .

RUN make witness_node cli_wallet delayed_node

RUN mkdir /data
VOLUME /data
WORKDIR /data

EXPOSE 8094
EXPOSE 8095