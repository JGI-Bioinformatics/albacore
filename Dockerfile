FROM ubuntu:16.04

LABEL Maintainer="Rob Egan<RSEgan@lbl.gov>"

WORKDIR /root

# This is necessary because the upgrade sometimes prompts for input
ENV DEBIAN_FRONTEND=noninteractive

ARG DEB=python3-ont-albacore_2.1.10-1~xenial_amd64.deb

ENV DEB_URL https://mirror.oxfordnanoportal.com/software/analysis/${DEB}

RUN apt-get update  && \
    apt-get install -y wget apt-transport-https strace \
     libhdf5-cpp-11 \
     python3 python3-setuptools \
     python3-h5py python3-numpy python3-dateutil python3-progressbar \
     libboost-filesystem1.58.0 libboost-program-options1.58.0 \
     libboost-system1.58.0 libboost-log1.58.0 libboost-thread1.58.0 \
     libboost-python1.58.0 && \
    wget -O- https://mirror.oxfordnanoportal.com/apt/ont-repo.pub | apt-key add - && \
    echo "deb https://mirror.oxfordnanoportal.com/apt xenial-stable non-free" | tee /etc/apt/sources.list.d/nanoporetech.sources.list && \
    apt-get update && \
    ( [ -f ${DEB} ] || wget -qO ${DEB} $DEB_URL ) && \
    ( dpkg -i ${DEB} ; apt-get install -fy ) && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* ${DEB} && \
    find / -name '*.pyc' -exec rm {} \;
   
ENV PYTHONDONTWRITEBYTECODE=1
ENV PATH=/bin:/usr/bin:/usr/local/bin

CMD ["read_fast5_basecaller.py", "-h"]

