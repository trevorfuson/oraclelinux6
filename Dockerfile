# Version: 0.0.1
FROM centos:centos6
MAINTAINER Trevor Fuson "trevor.fuson@unbc.ca"
# Conversion script doesn't run with touching this file, must be a bug
RUN [ "touch", "/etc/yum.repos.d/libselinux.repo" ]
RUN [ "rm", "/etc/yum.repos.d/libselinux.repo" ]
# Install the kernel to allow the conversion script to complete
RUN [ "yum", "install", "kernel", "-y" ]
RUN [ "curl", "-O", "https://linux.oracle.com/switch/centos2ol.sh" ]
RUN [ "sh", "centos2ol.sh" ]
RUN [ "yum", "upgrade", "-y" ]
# cat /etc/oraclelinux-release