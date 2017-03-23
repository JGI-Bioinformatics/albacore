FROM ubuntu:16.04
MAINTAINER Rob Egan

WORKDIR /root

ENV DEB_URL https://mirror.oxfordnanoportal.com/software/analysis/python3-ont-albacore_0.8.4-1-xenial_all.deb
#ENV WHL_FILE ont_albacore-0.8.4-cp35-cp35m-manylinux1_x86_64.whl
#ENV WHL_URL https://mirror.oxfordnanoportal.com/software/analysis/${WHL_FILE}

RUN apt-get update  && \
    apt-get install -y wget python3-setuptools \
     python3-h5py python3-numpy \
     libboost-filesystem1.58.0 libboost-program-options1.58.0 \
     libboost-system1.58.0 libboost-log1.58.0 libboost-thread1.58.0 \
     libboost-python1.58.0 && \
    wget -qO albacore.deb $DEB_URL && \
    dpkg -i albacore.deb  && \
    apt-get install -fy && \
    apt-get remove -y wget && \
    apt-get autoremove -y && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* albacore.deb
   

#RUN wget -qO ${WHL_FILE} ${WHL_URL}

ENTRYPOINT ["read_fast5_basecaller.py"]

CMD ["-h"]

