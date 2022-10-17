# vim:ft=dockerfile

FROM ubuntu:20.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake libgmp-dev libmpfr-dev libmpc-dev \
        libboost-all-dev bison texinfo \
        ruby flex curl g++

ADD . /Retro68

RUN mkdir /Retro68-build

RUN bash -c "cd /Retro68-build && bash /Retro68/build-toolchain.bash --clean-after-build"
