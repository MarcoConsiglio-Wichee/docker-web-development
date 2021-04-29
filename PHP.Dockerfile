FROM alpine:3.13

RUN apk update && apk upgrade && \
    apk add --no-cache \
    apache2 \
    curl \
    g++ \
    gcc \
    make \
    nano \
    npm \
    php7 \
    zlib-dev \
    php7-apache2 \
    php7-curl \
    php7-dev \
    php7-fileinfo \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-openssl \
    php7-pdo_mysql \
    php7-pdo_sqlite \
    php7-pear \
    php7-phar \
    php7-session \
    php7-soap \
    php7-tokenizer \
    php7-xdebug \
    php7-xml \
    php7-xmlwriter \
    php7-xsl \
    php7-zip \
    sqlite


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer

COPY config/httpd.conf /etc/apache2/httpd.conf
# COPY config/vhost.conf /etc/apache2/conf.d/.
COPY config/xdebug.ini /etc/php7/conf.d/xdebug.ini
COPY config/php.ini /etc/php7/php.ini

RUN set -x ; \
  addgroup -g 82 -S www-data ; \
  adduser -u 82 -D -S -G www-data www-data ; \
	chown -R www-data:www-data /var/www/localhost/htdocs
	
RUN apk add --no-cache libc6-compat

WORKDIR /var/www/localhost/htdocs/

CMD echo "options single-request" >> /etc/resolv.conf && httpd && tail -f /var/log/apache2/*.log
