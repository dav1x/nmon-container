FROM registry.fedoraproject.org/fedora:36

RUN dnf update -y && \
dnf install -y ksh iperf net-tools iptables iputils nmon && \
dnf clean all && \
curl -LO http://sourceforge.net/projects/nmon/files/nmonchart40.tar && \
tar xvf nmonchart40.tar -C /usr/local/bin

CMD [/bin/sh]
