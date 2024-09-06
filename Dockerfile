FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install -y --no-install-recommends python3-pip=22.0.* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash eva && \
  chown -R eva:eva /home/eva

USER eva

ENV PATH="${PATH}:/home/eva/.local/bin"

RUN python3 -m pip install --no-cache-dir --user \
  ansible==10.3.* argcomplete==3.5.* && \
  activate-global-python-argcomplete --user

COPY src/* /home/eva/

WORKDIR /home/eva
