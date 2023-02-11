# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: exemple <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:41:09 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/08 16:41:10 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/mmasstou.key -out /etc/ssl/certs/mmasstou.crt -subj="/C=MA/ST=rabat/O=./CN=exemple.42.fr"
# COPY conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]