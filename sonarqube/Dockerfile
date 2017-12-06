FROM registry.cn-beijing.aliyuncs.com/swang/jdk:8
MAINTAINER swang
WORKDIR /usr/local
EXPOSE 9000
RUN groupadd -r sonarqube && useradd -r -g sonarqube sonarqube
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
COPY run.sh /usr/local/sonarqube/bin/
RUN chmod +x /usr/local/sonarqube/bin/run.sh
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true
ENTRYPOINT ["./sonarqube/bin/run.sh"]