FROM ubuntu:22.04

RUN apt-get update && \
  apt-get install -y --no-install-recommends python3-pip=22.0.* python3-apt=2.4.* openssh-client=1:8.9* sshpass=1.* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

ENV PIP_ROOT_USER_ACTION=ignore

RUN python3 -m pip install --no-cache-dir \
  ansible==10.3.* argcomplete==3.5.* && \
  activate-global-python-argcomplete

COPY src/ /root

ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /root
