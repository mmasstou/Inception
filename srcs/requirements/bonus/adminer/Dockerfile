# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmasstou <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:41:21 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/08 16:41:22 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y php  wget  php-mysql

WORKDIR /var/www/html/wordpress
RUN wget https://www.adminer.org/static/download/4.8.1/adminer-4.8.1.php
RUN mv adminer-4.8.1.php index.php
EXPOSE 8080

CMD [ "php", "-S", "[::]:8080 ssl" , "-t", "/var/www/html/wordpress" ]
