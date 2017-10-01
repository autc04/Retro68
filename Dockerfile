# vim:ft=dockerfile
FROM ubuntu:16.04

RUN apt-get update && apt-get -y install \
    g++ \
    cmake libgmp-dev libmpfr-dev libmpc-dev libboost-all-dev bison \
    zlib1g-dev \
    perl texinfo
    
RUN mkdir /root/Retro68
COPY . /root/Retro68/

RUN mkdir /root/Retro68-build

RUN sh -c "cd /root/Retro68-build && sh ../Retro68/build-toolchain.sh --clean-after-build"