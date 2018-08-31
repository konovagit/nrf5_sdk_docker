#Nordic SDK 13.0.0

FROM ubuntu:16.04

MAINTAINER Corentin Corde <corentincorde@gmail.com>

ENV SDK_ROOT=/opt/nordic

RUN apt-get update \
    && apt-get install -y lib32ncurses5 lib32z1 \
    && apt-get install -y gcc-arm-none-eabi \
    && apt-get install -y gdb-arm-none-eabi \
    && apt-get install -y build-essential \
    && apt-get install -y unzip \
		&& apt-get install -y wget

RUN mkdir -p /opt/nordic \
		&& wget https://developer.nordicsemi.com/nRF5_SDK/nRF5_SDK_v13.x.x/nRF5_SDK_13.0.0_04a0bfd.zip -O nordic_sdk.zip \
		&& unzip nordic_sdk.zip 'components/*' 'external/*' 'svd/*' -d $SDK_ROOT \
		&& rm nordic_sdk.zip

COPY Makefile.posix $SDK_ROOT/components/toolchain/gcc/Makefile.posix
