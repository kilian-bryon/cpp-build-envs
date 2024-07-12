FROM kbryon/cpp-build-envs:cmake3.29.2

WORKDIR /build

# Install clang 16
RUN wget https://apt.llvm.org/llvm.sh
RUN chmod +x llvm.sh
RUN ./llvm.sh 16
RUN update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-16 100
RUN update-alternatives --install /usr/bin/clang clang /usr/bin/clang-16 100
RUN apt-get install --no-install-recommends -y \
 libc++-16-dev \
 libc++abi-16-dev \
 libomp-16-dev \
 clang-tidy-16 \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /project
