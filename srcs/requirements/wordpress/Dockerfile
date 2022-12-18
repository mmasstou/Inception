FROM debian:buster

RUN apt-get update
RUN apt-get -y install php php-fpm  php-mysqli wget  curl unzip

RUN mkdir -p  /run/php

WORKDIR /var/www/html
EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/


COPY ./tools /var/www/

RUN chmod +x /var/www/wp_config.sh

ENTRYPOINT [ "/var/www/wp_config.sh" ]

CMD ["php-fpm7.3", "-F"]