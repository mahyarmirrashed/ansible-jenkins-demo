FROM ubuntu:22.04

RUN useradd -m -s /bin/bash eva && \
  mkdir -p /home/eva/src && \
  chown -R eva:eva /home/eva

USER eva

WORKDIR /home/eva
