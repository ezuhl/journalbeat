FROM centos:latest
MAINTAINER http://www.centos.org
LABEL Vendor="CentOS"
LABEL License=GPLv2
LABEL Version=2.4.6-31
VOLUME /app/go
RUN yum -y update && yum clean all
RUN yum -y install git
RUN yum -y install gcc
RUN yum -y install wget
RUN yum -y install tar
#RUN yum -y install golang
RUN /bin/bash -c 'cd /usr/local/src; \
wget https://storage.googleapis.com/golang/go1.5.2.linux-amd64.tar.gz; \
tar -C /usr/local -xzf /usr/local/src/go1.5.2.linux-amd64.tar.gz; \
echo "$PATH" /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin; \
ln -s /usr/local/go/bin/go /bin/go; \
ln -s /usr/local/go/bin/godoc /bin/godoc; \
ln -s /usr/local/go/bin/gofmt /bin/gofmt;'
RUN yum -y install systemd-devel
ENV GOPATH /app/go
ENV GOROOT /usr/local/go
ENV GOBIN $GOPATH/bin
ENV PATH $PATH:/usr/bin/go:$GOPATH/bin
WORKDIR /app/go
RUN go get -d -v
RUN go build
