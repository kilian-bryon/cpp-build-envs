# C++ Building Environments
Building C++ projects often involves dealing with a multitude of dependencies that must be installed on the host system. When collaborating on project repositories, this challenge becomes even more pronounced due to variations across different hosts.

Enter containerized environments! These containers offer a solution by providing consistent C++ build environments that can be easily shared among software development teams. Say goodbye to the headache of missing dependencies.

DockerHub: https://hub.docker.com/repository/docker/kbryon/cpp-build-envs/general

These images come preloaded with following packages:
* wget
* build-essential
* curl
* zip
* unzip
* tar
* ninja-build
* git
* pkg-config
* libssl-dev
* CMake 3.29.2

Depending on the version:
* libc++-dev
* libc++abi-dev
* libomp-dev
* clang-tidy
All the container images are based on Ubuntu 22.04 and come preloaded with CMake 3.29.2.
