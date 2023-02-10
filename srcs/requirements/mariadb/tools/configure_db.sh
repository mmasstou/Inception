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


