FROM ubuntu:16.04

LABEL Maintainer="Rob Egan<RSEgan@lbl.gov>"

WORKDIR /root

ENV DEB_URL http://mirror.oxfordnanoportal.com/software/analysis/python3-ont-albacore_1.0.1-1~xenial_all.deb

# This is necessary because the upgrade sometimes prompts for input
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update  && \
    apt-get install -y wget python3-setuptools \
     python3-h5py python3-numpy \
     libboost-filesystem1.58.0 libboost-program-options1.58.0 \
     libboost-system1.58.0 libboost-log1.58.0 libboost-thread1.58.0 \
     libboost-python1.58.0 && \
    wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add - && \
    wget -qO albacore.deb $DEB_URL && \
    apt-get update && \
    ( dpkg -i albacore.deb ; apt-get install -fy ) && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* albacore.deb && \
    find / -name '*.pyc' -exec rm {} \;
   

CMD ["read_fast5_basecaller.py", "-h"]

