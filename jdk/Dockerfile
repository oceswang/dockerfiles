FROM registry.cn-beijing.aliyuncs.com/swang/centos
MAINTAINER swang
WORKDIR /usr/local
RUN yum -y install wget
RUN wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/jdk-8u151-linux-x64.tar.gz
ENV JAVA_HOME=/usr/local/jdk1.8.0_151
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib

