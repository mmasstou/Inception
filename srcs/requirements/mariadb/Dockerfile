# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmasstou <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:41:00 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/08 16:41:01 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/configure_db.sh /tmp
RUN chmod 777 /tmp/configure_db.sh 
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT ["sh", "/tmp/configure_db.sh"]
CMD [ "mysqld" ]
