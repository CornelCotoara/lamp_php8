
FROM fpm-alpine3.15
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
RUN apk add --no-cache bash \
        apache2 \
				libxml2-dev \
				apache2-utils
        
RUN ln -sf /usr/bin/php8 /usr/bin/php
RUN curl -sS https://getcomposer.org/installer | php8 -- --install-dir=/usr/bin --filename=composer 

RUN  rm -rf /var/cache/apk/*

# AllowOverride ALL
RUN sed -i '264s#AllowOverride None#AllowOverride All#' /etc/apache2/httpd.conf
#Rewrite Moduble Enable
RUN sed -i 's#\#LoadModule rewrite_module modules/mod_rewrite.so#LoadModule rewrite_module modules/mod_rewrite.so#' /etc/apache2/httpd.conf
# Document Root to /var/www/html/
RUN sed -i 's#/var/www/localhost/htdocs#/var/www/html#g' /etc/apache2/httpd.conf
#Start apache
RUN mkdir -p /run/apache2

RUN mkdir /var/www/html/

VOLUME  /var/www/html/
WORKDIR  /var/www/html/

EXPOSE 80
EXPOSE 443

CMD /usr/sbin/apachectl  -D   FOREGROUND
