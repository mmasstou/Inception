# FROM debian:latest

# RUN	apt-get update && apt-get upgrade && apt-get install -y mariadb-server mariadb-client systemctl

# COPY tools/configure.sh configure.sh

# RUN rm -rf /var/run/mysqld &&  mkdir -p /var/run/mysqld && chown mysql /var/run/mysqld

# RUN chmod +x configure.sh

# ENTRYPOINT ["sh", "configure.sh"]

# CMD [ "mysqld_safe" ]
# # RUN apt-get update && apt-get upgrade -y

# # RUN apt-get install mariadb-server  -y
# # RUN apt-get install  -y systemctl

# # COPY tools/configure.sh configure.sh

# # ENTRYPOINT ["sh", "configure.sh"]

FROM debian:buster

RUN apt-get update
RUN apt-get install -y mariadb-server

EXPOSE 3306

COPY ./tools/create_DB.sql /tmp

RUN service mysql start && mysql < /tmp/create_DB.sql && rm -f /tmp/create_DB.sql;

CMD ["mysqld"]