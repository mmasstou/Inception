#!/bin/bash

service mysql start;

# if [! -f  "/tmp/create_DB.sql" ]; then 

# touch /tmp/create_DB.sql;
# fi

chmod 0777 /tmp/create_DB.sql;

cat << EOF > "/tmp/create_DB.sql"
CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;
CREATE USER IF NOT EXISTS '$DATABASE_USER'@'%' IDENTIFIED BY '$DATABASE_PWD';
GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_USER'@'%';
FLUSH PRIVILEGES;
ALTER USER '$DATABASE_ADMIN_USER'@'localhost' IDENTIFIED BY '$DATABASE_ADMIN_PWD';
EOF

# mysql < /tmp/create_DB.sql

# exec "$@"