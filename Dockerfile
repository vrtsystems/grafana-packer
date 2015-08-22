FROM centos:6.6

RUN yum install -y initscripts curl tar gcc libc6-dev git gcc-c++ openssl-devel
RUN yum install -y g++ make automake autoconf curl-devel zlib-devel httpd-devel apr-devel apr-util-devel sqlite-devel
RUN yum install -y wget yum-utils bzip2 bzip2-devel
RUN yum install -y fontconfig freetype freetype-devel fontconfig-devel libstdc++
RUN yum install -y rpm-build patch readline readline-devel libtool bison

# Install RUBY 1.9.3
# install necessary utilities
RUN yum install -y which tar
RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable
RUN source /etc/profile.d/rvm.sh
RUN /bin/bash -l -c "rvm requirements"
RUN /bin/bash -l -c "rvm install 1.9.3"
RUN /bin/bash -l -c "rvm use 1.9.3 --default"

# install nodejs
RUN curl -sL https://rpm.nodesource.com/setup | bash -
RUN yum install -y nodejs --nogpgcheck

ENV GOLANG_VERSION 1.4.2

RUN curl -sSL https://golang.org/dl/go$GOLANG_VERSION.src.tar.gz \
		| tar -v -C /usr/src -xz

RUN cd /usr/src/go/src && ./make.bash --no-clean 2>&1

ENV PATH /usr/src/go/bin:$PATH

RUN mkdir -p /go/src /go/bin && chmod -R 777 /go

ENV GOPATH /go
ENV PATH /go/bin:$PATH

ADD build.sh /tmp/

WORKDIR /tmp/

CMD ["./build.sh"]
