FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server \
    php \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    curl


RUN mkdir /run/php
COPY ./conf/wp_config.sh  /tmp/wp_config.sh
COPY ./tools/www.conf /etc/php/7.3/fpm/pool.d/www.conf
RUN chmod +x /tmp/wp_config.sh
RUN wget https://wordpress.org/latest.zip

RUN mkdir -p /var/www/html && chmod +x /var/www/html


RUN unzip latest.zip -d /var/www/html


ENTRYPOINT [ "/tmp/wp_config.sh" ]

CMD ["php-fpm7.3", "-F"]