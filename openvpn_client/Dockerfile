FROM centos
MAINTAINER swang
WORKDIR /usr/local
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
RUN yum clean all && yum makecache && yum update
RUN yum -y install unzip gcc make openssl-devel lzo-devel pam-devel net-tools
COPY openvpn-2.3.4.zip .
RUN unzip openvpn-2.3.4
RUN cd openvpn-2.3.4 && ./configure --prefix=/usr/local/openvpn && make && make install
RUN rm -rf ../openvpn-2.3.4 && rm -rf openvpn-2.3.4.zip
RUN mkdir /usr/local/openvpn/config && mkdir /usr/local/openvpn/log
ENV NSS_HASH_ALG_SUPPORT +MD5
ENV OPENSSL_ENABLE_MD5_VERIFY 1
VOLUME ["/usr/local/openvpn/config","/usr/local/openvpn/log"]
ENTRYPOINT ["/usr/local/openvpn/sbin/openvpn","--config","/usr/local/openvpn/config/client.conf"]