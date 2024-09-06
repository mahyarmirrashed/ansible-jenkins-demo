FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install -y --no-install-recommends ansible=2.10.* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash eva && \
  chown -R eva:eva /home/eva

USER eva

WORKDIR /home/eva
