FROM ubuntu:22.04

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && \
  apt-get install -y --no-install-recommends python3=3.10.* openssh-server=1:8.9* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
  echo "root:root" | chpasswd

RUN mkdir /run/sshd

WORKDIR /root
