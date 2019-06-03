FROM ubuntu:18.04

ADD https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz /tmp/

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH
ENV GOPROXY https://athens.azurefd.net

RUN mkdir -p "$GOPATH/src" "$GOPATH/bin" && chmod -R 777 "$GOPATH" \
    && tar xvf /tmp/go1.11.5.linux-amd64.tar.gz -C /usr/local && rm -rf /tmp/*

RUN apt update && apt install -y gcc g++\
    && rm -rf /var/lib/apt/lists/*

WORKDIR $GOPATH