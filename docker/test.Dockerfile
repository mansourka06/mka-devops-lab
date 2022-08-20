FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y python python3-pip && \
    apt-get install -y curl ssh

