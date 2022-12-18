#!/bin/sh

if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
    chown mysql /run/mysqld
else
    chown mysql /run/mysqld
fi
etc/init.d/mysql start
if [ ! -d "/var/lib/mysql/$DATABASE_NAME" ]; then

# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';" | mysql -uroot 

echo "CREATE DATABASE $DATABASE_NAME ; " | mysql -u root 
echo "CREATE USER '$DATABASE_USR'@'%' IDENTIFIED by '$DATABASE_PWD';" | mysql -u root 
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%';" | mysql -u root 

echo "FLUSH PRIVILEGES;" | mysql -uroot 
etc/init.d/mysql stop


fi

exec "$@"
