# vim:ft=dockerfile

# Base image
FROM ubuntu:20.04 AS base

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        cmake libgmp-dev libmpfr-dev libmpc-dev \
        libboost-all-dev bison texinfo \
        ruby flex curl g++ git macutils

# Add toolchain to default PATH
ENV PATH=/Retro68-build/toolchain/bin:$PATH
WORKDIR /root

# Build image
FROM base AS build

ADD . /Retro68

RUN mkdir /Retro68-build && \
    mkdir /Retro68-build/bin && \
    bash -c "cd /Retro68-build && bash /Retro68/build-toolchain.bash"

# Release image
FROM base AS release

COPY --from=build \
    /Retro68/interfaces-and-libraries.sh \
    /Retro68/prepare-headers.sh \
    /Retro68/prepare-rincludes.sh \
    /Retro68-build/bin/

COPY --from=build /Retro68-build/toolchain /Retro68-build/toolchain

LABEL org.opencontainers.image.source https://github.com/autc04/Retro68
