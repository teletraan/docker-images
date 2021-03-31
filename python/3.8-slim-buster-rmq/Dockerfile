FROM python:3.8-slim-buster

RUN apt-get update \
  && apt-get install -y wget \
  && rm -rf /var/lib/apt/lists/* \
  && wget https://repo-mirror.s3.cn-northwest-1.amazonaws.com.cn/rocketmq/rocketmq-client-cpp-2.0.0.amd64.deb \
  && dpkg -i rocketmq-client-cpp-2.0.0.amd64.deb \
  && rm rocketmq-client-cpp-2.0.0.amd64.deb

