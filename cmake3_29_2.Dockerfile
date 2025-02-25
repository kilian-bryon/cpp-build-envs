FROM ubuntu:22.04

WORKDIR /build

ENV TZ=Europe/Brussels
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
  software-properties-common \
  wget \
  build-essential \
  curl \
  zip \
  tar \
  ninja-build \
  unzip \
  git \
  pkg-config \
  libssl-dev \
  && rm -rf /var/lib/apt/lists/*

# Install CMake v3.29.2
RUN wget http://www.cmake.org/files/v3.29/cmake-3.29.2.tar.gz \
  && tar xf cmake-3.29.2.tar.gz \
  && chmod +x ./cmake-3.29.2/configure \
  && ./cmake-3.29.2/configure \
  && make install