FROM registry.cn-beijing.aliyuncs.com/swang/jdk:8
MAINTAINER swang
WORKDIR /usr/local
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
RUN yum clean all
RUN yum makecache
RUN yum -y update
RUN yum -y install wget unzip
RUN wget https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-6.7.zip
RUN unzip sonarqube-6.7.zip && rm -rf sonarqube-6.7.zip && mv sonarqube-6.7 sonarqube
VOLUME ["/usr/local/sonarqube/logs","/usr/local/sonarqube/conf","/usr/local/sonarqube/extensions"]
EXPOSE 9000
ENTRYPOINT ["/usr/local/sonarqube/bin/linux-x86-64/sonar.sh", "start"]