FROM phpdockerio/php71-fpm:latest

MAINTAINER vitams

RUN apt-get update \
    && apt-get -y --no-install-recommends install \
    php7.1-memcached \
    php7.1-memcache \
    php7.1-mbstring \
    php7.1-mysql \
    php7.1-intl \
    php7.1-xdebug \
    php7.1-interbase \
    php7.1-soap \
    php7.1-gd \
    php7.1-imagick \
    php7.1-mcrypt \
    php7.1-opcache \
    php7.1-zip \
    ssmtp \
    && echo "FromLineOverride=YES" >> /etc/ssmtp/ssmtp.conf\
    && echo 'sendmail_path = "/usr/sbin/ssmtp -t"' > /usr/local/etc/php/conf.d/mail.ini\
    && apt-get clean; rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

RUN usermod -u 1000 www-data

ENV BITRIX_MAIL_HOST=mail

COPY ./entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9000
