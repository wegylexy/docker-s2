FROM buildpack-deps:bullseye
RUN apt-get update && apt-get -y install libgtest-dev cmake
WORKDIR /src
RUN wget -q https://github.com/google/s2geometry/archive/master.zip && \
    unzip master.zip && cd s2geometry-master && \
    mkdir build && cd build && \
    cmake -DBUILD_EXAMPLES=OFF .. && \
    make -j $(nproc) && make install && \
    rm -rf /src