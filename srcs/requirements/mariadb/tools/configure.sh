#!/bin/sh
if [ ! -d "/run/mysqld" ]; then
    mkdir -p /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then

    # init database
    mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm >/dev/null


    # https://stackoverflow.com/questions/10299148/mysql-error-1045-28000-access-denied-for-user-billlocalhost-using-passw
    cat <<EOF > "/tmp/mktemp"
USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';

CREATE DATABASE $DATABASE_NAME CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$DATABASE_USR'@'%' IDENTIFIED by '$DATABASE_PWD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USR'@'%';

FLUSH PRIVILEGES;
EOF
    # run init.sql
    /usr/bin/mysqld --user=mysql --bootstrap < "/tmp/mktemp"
    rm -f  "/tmp/mktemp"
fi

# tail -f /dev/null
