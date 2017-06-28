FROM centos:7
MAINTAINER The CentOS Project <cloud-ops@centos.org>
LABEL Vendor="CentOS" \
      License=GPLv2 \
      Version=2.4.6-40


RUN yum update 
RUN yum -y upgrade
RUN yum -y install git yum-utils \
&& rpm --import "http://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" \
&& yum-config-manager --add-repo http://download.mono-project.com/repo/centos/ \   

EXPOSE 8081

