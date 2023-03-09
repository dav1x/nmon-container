FROM registry.access.redhat.com/ubi8/ubi:latest 

ENV s=1
ENV c=1800
ENV T=true

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm


RUN dnf update -y && \
dnf install -y nmon diffutils && \
dnf clean all && \
curl -LO http://sourceforge.net/projects/nmon/files/nmonchart40.tar && \
tar xvf nmonchart40.tar -C /usr/bin/ 

RUN rpm -ivh https://vault.centos.org/centos/8/AppStream/x86_64/os/Packages/ksh-20120801-254.el8.x86_64.rpm

ADD entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

WORKDIR /opt/nmon

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
#CMD ["/bin/sh"]
