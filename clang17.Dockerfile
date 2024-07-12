FROM kbryon/cpp-build-envs:cmake3.29.2

WORKDIR /build

# Install clang 17
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 17
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-17 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-17 100
RUN apt-get install --no-install-recommends -y \
 libc++-17-dev \
 libc++abi-17-dev \
 libomp-17-dev \
 clang-tidy-17 \
 && rm -rf /var/lib/apt/lists/*

 WORKDIR /project
 