###
FROM centos:centos7 

WORKDIR /root

# install RPMs
## httpd
RUN yum install -y httpd 

## timezone
RUN yum install -y tzdata
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

## jq
RUN curl -L -o /usr/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod 755 /usr/bin/jq

## perl
RUN yum install -y perl

RUN yum clean all

# config
ADD httpd.conf /etc/httpd/conf/

# コンテンツ
ADD htdocs/*      /var/www/html/
ADD htdocs/auth   /var/www/html/auth/
ADD cgi-bin/*     /var/www/cgi-bin/
RUN chmod 755 /var/www/cgi-bin/*

# ログ
RUN ln -s /dev/stdout /var/log/httpd/error_log

# 実行
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

