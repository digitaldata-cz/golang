FROM --platform=amd64 ubuntu:22.04

ARG VERSION=1.18.2

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

WORKDIR $GOPATH

RUN apt-get update && \
    apt-get install -y curl git gcc mingw-w64 && \
    && rm -rf /var/lib/apt/lists/*
RUN curl --output /dev/stdout https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz | tar -C /usr/local -xz
RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH"
