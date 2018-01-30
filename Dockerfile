FROM ubuntu-upstart:latest

MAINTAINER Evan Sultanik version: 0.1

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y git \
     python2.7 \
     wget \
     realpath \
     build-essential \
     libtinfo-dev \
     lsb-release

RUN mkdir /home/remill

WORKDIR /home/remill

RUN git clone https://github.com/trailofbits/remill.git

WORKDIR /home/remill/remill

RUN ./scripts/build.sh

RUN useradd -ms /bin/bash remill

RUN chown -R remill:remill /home/remill/remill

USER remill

ENTRYPOINT /bin/bash