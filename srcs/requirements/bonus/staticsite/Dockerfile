# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmasstou <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:41:35 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/08 16:41:36 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx

RUN mkdir -p  /var/www/html
COPY ./tools/ /var/www/html/

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 8000
CMD [ "nginx", "-g", "daemon off;" ]