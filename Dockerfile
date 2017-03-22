FROM alpine:3.5
MAINTAINER Rob Egan

ENV DEB_URL https://mirror.oxfordnanoportal.com/software/analysis/python3-ont-albacore_0.8.4-1-trusty_all.deb

WORKDIR /root

RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y wget libboost-all-dev python3-setuptools && \
 wget -qO albacore.deb $DEB_URL && \
 dpkg -i albacore.deb  && \
 apt-get install -fy

ENTRYPOINT ["read_fast5_basecaller.py"]

CMD ["-h"]
