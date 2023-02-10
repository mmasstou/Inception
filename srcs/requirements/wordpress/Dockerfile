# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmasstou <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:41:48 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/08 16:50:45 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server \
    php \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    curl
# install Wordpress CLI and put in the Folder : /usr/local/bin/wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# create /run/php :
# create /var/www/html : 
RUN mkdir /run/php && mkdir -p /var/www/html && chmod +x /var/www/html
# copy the script to `/tmp/` to execute in container  and www.conf to `/etc/php/7.3/fpm/pool.d/` to update the config of fpm
COPY ./tools/wp_config.sh  /tmp/wp_config.sh
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /tmp/wp_config.sh 


ENTRYPOINT [ "/tmp/wp_config.sh"]

CMD ["php-fpm7.3", "-F"]