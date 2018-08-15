# vim:ft=dockerfile

FROM ubuntu:18.04

RUN apt-get update && apt-get -y install \
    g++ \
    cmake libgmp-dev libmpfr-dev libmpc-dev libboost-all-dev bison \
    zlib1g-dev \
    perl texinfo

ADD . /Retro68

RUN mkdir /Retro68-build

RUN bash -c "cd /Retro68-build && bash /Retro68/build-toolchain.bash --clean-after-build"
