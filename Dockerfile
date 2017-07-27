# Install
# $ docker pull ubuntu:16.10
# $ docker build -t ubuntu-bc2 .
# $ docker run -i -t ubuntu-bc2 /bin/bash
#
# Cheat sheet
# Remove all containers
# $ docker stop $(sudo docker ps -a -q) && sudo docker rm $(sudo docker ps -a -q)
# Remove the image
# $ docker rmi ubuntu-bc2

FROM ubuntu:16.10

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin
RUN apt-get update

RUN apt-get install -y git
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libgmp-dev gmp-doc
RUN apt-get install -y jq
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev
# For Japanese
RUN apt-get install -y language-pack-ja-base language-pack-ja

WORKDIR bc2
RUN git clone https://github.com/dgarage/bc2.git
RUN git clone https://github.com/dgarage/elements.git

WORKDIR bc2
RUN ./autogen.sh
RUN ./configure
RUN make

WORKDIR ../elements
RUN ./autogen.sh
RUN ./configure
RUN make

# For passing check
RUN apt-get install -y systemd
ENV LC_ALL=ja_JP.UTF-8

WORKDIR ../bc2

RUN ./conference/check.sh
