FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN yum -y update; yum clean all \
&& rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" \
&& yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ \   
&& yum check-update \
RUN yum -y install mono-complete; yum clean all
RUN yum -y install git; yum clean all

RUN git clone https://github.com/CoiniumServ/CoiniumServ.git 
RUN cd /CoiniumServ; git submodule init; git submodule update

RUN sh /CoiniumServ/bin/Release/build.sh



EXPOSE 8081

CMD ["mono", "/CoiniumServ/bin/Release/CoiniumServ.exe"]
