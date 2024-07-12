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

# Install clang 18
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 18
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-18 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-18 100
RUN apt-get install --no-install-recommends -y \
 libc++-18-dev \
 libc++abi-18-dev \
 libomp-18-dev \
 clang-tidy-18 \
 && rm -rf /var/lib/apt/lists/*

 WORKDIR /project
