FROM kbryon/cpp-build-envs:cmake3.29.2

WORKDIR /build

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
