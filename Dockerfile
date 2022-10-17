# vim:ft=dockerfile

# Base image
FROM ubuntu:20.04 AS base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake libgmp-dev libmpfr-dev libmpc-dev \
        libboost-all-dev bison texinfo \
        ruby flex curl g++

# Build image
FROM base AS build

ADD . /Retro68

RUN mkdir /Retro68-build && \
    bash -c "cd /Retro68-build && bash /Retro68/build-toolchain.bash"

# Release image
FROM base AS release

COPY --from=build /Retro68-build/toolchain /Retro68-build/toolchain
