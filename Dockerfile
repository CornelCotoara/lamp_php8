
FROM httpd:alpine3.15
MAINTAINER Cornel Cotora

ARG TZ='Europe/Bucharest'
ENV DEFAULT_TZ ${TZ}
RUN apk --update -- upgrade && \
  apk add --no-cache tzdata && \
  cp /usr/share/zoneinfo/${DEFAULT_TZ} /etc/localtime && \
  date

RUN set -xe \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/comunity"  >> /etc/apk/repositories \
  && echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing"  >> /etc/apk/repositories \
  && apk --update -- upgrade
# prerequisites
RUN apk add --no-cache  	php8-intl \
				php8-openssl \
				php8-dba \
				php8-sqlite3 \
				php8-pear \
				php8-phpdbg \
				php8-litespeed \
				php8-gmp \
				php8-pdo_mysql \
				php8-pcntl \
				php8-common \
				php8-xsl \
				php8-fpm \	
				php8-mysqlnd \
				php8-enchant \
				php8-pspell \
				php8-snmp \
				php8-doc \
				php8-mbstring \
				php8-dev \
				php8-pecl-xmlrpc \
				php8-embed \
				php8-xmlreader \
				php8-pdo_sqlite \
				php8-exif \
				php8-opcache \
				php8-ldap \
				php8-posix \	
				php8-session \
				php8-gd  \
				php8-gettext \
				php8-json \
				php8-pecl-xmlrpc \
				php8 \
				php8-iconv \
				php8-sysvshm \
				php8-curl \
				php8-shmop \
				php8-odbc \
				php8-phar \
				php8-pdo_pgsql \
				php8-imap \
				php8-pdo_dblib \
				php8-pgsql \
				php8-pdo_odbc \
				php8-xdebug \
				php8-zip \
				php8-apache2 \
				php8-cgi \
				php8-ctype \
				php8-pecl-mcrypt \
#				php8-wddx \
				php8-bcmath \
				php8-calendar \
				php8-tidy \
				php8-dom \
				php8-sockets \
				php8-soap \
				php8-apcu \
				php8-sysvmsg \
				php8-zlib \
				php8-ftp \
				php8-sysvsem \ 
				php8-pdo \
				php8-bz2 \
				php8-mysqli \
				libxml2-dev



