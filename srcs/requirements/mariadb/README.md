# MariaDB Container

The MariaDB container contains the MariaDB database server, without NGINX.

Folder File :

* `tools/configure_db.sh`
* `Dockerfile`

> tools/configure_db.sh

```
#!/bin/bash

echo "DB -- Configuration"


if [ ! -d /var/lib/mysql/$DATABASE_NAME ]; then 
    service mysql start
    echo "DB -- Create Database '$DATABASE_NAME'"
    mysql -u $DATABASE_ADMIN_USER -e "CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;"
    mysql -u $DATABASE_ADMIN_USER -e "CREATE USER IF NOT EXISTS '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PWD';"
    mysql -u $DATABASE_ADMIN_USER -e "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';"
    mysql -u $DATABASE_ADMIN_USER -e "FLUSH PRIVILEGES;"
    mysql -u $DATABASE_ADMIN_USER -e "ALTER USER '$DATABASE_ADMIN_USER'@'localhost' IDENTIFIED BY '$DATABASE_ADMIN_PWD';"
    kill $(cat /var/run/mysqld/mysqld.pid)
fi


exec "$@"

```
The script uses the mysql command to execute these SQL statements. The MySQL service is started and stopped as needed for the execution of these commands.

> Dockerfile

```
FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server
COPY ./tools/configure_db.sh /tmp
RUN chmod 777 /tmp/configure_db.sh 
RUN sed -i "s|bind-address            = 127.0.0.1|bind-address            = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf
ENTRYPOINT ["sh", "/tmp/configure_db.sh"]
CMD [ "mysqld" ]

```

The RUN command with apt-get update && apt-get install -y mariadb-server updates the package lists and installs the MariaDB server on the image.

The COPY command is used to copy a shell script "configure_db.sh" to the "/tmp" directory of the image. The script will be used to configure the database.

The RUN command with chmod 777 /tmp/configure_db.sh sets the execute permissions on the script.

The RUN command with sed -i "s|bind-address = 127.0.0.1|bind-address = 0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf is used to modify the MariaDB configuration file, allowing the database to listen on all available network interfaces, not just the local host.

The ENTRYPOINT command sets the default command that will be run when a container is started from the image. In this case, it is the script "/tmp/configure_db.sh".

The CMD command specifies the default command arguments that will be passed to the ENTRYPOINT. In this case, it is "mysqld", the MariaDB daemon.