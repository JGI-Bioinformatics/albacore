FROM ubuntu:16.04

LABEL Maintainer="Rob Egan<RSEgan@lbl.gov>"

WORKDIR /root

ENV DEB_URL https://mirror.oxfordnanoportal.com/software/analysis/python3-ont-albacore_1.1.0-1~xenial_all.deb

# This is necessary because the upgrade sometimes prompts for input
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  && \
    apt-get install -y wget apt-transport-https \
     python3-setuptools python3-h5py python3-numpy python3-dateutil \
     libboost-filesystem1.58.0 libboost-program-options1.58.0 \
     libboost-system1.58.0 libboost-log1.58.0 libboost-thread1.58.0 \
     libboost-python1.58.0 && \
    wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add - && \
    echo "deb http://mirror.oxfordnanoportal.com/apt trusty-stable non-free" | tee /etc/apt/sources.list.d/nanoporetech.sources.list && \
    wget -qO albacore.deb $DEB_URL && \
    apt-get update && \
    ( dpkg -i albacore.deb || /bin/true ) && \
    apt-get install -fy python3-ont-albacore python3-ont-fast5-api && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    echo rm -rf /var/lib/apt/lists/* albacore.deb && \
    find / -name '*.pyc' -exec rm {} \;

CMD ["read_fast5_basecaller.py", "-h"]

