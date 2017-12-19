#!/bin/bash
sed -i 's/^\(mailhub=\).*/\1'"$BITRIX_MAIL_HOST"'/' /etc/ssmtp/ssmtp.conf
/usr/bin/php-fpm
