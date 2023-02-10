#!/bin/bash

echo "WP -- Configuration"

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    wp core download --allow-root --path=/var/www/html/wordpress
    wp config create --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PWD} --dbhost=mariadb --path=/var/www/html/wordpress  --allow-root
    wp config set WP_REDIS_HOST "${WP_REDIS_HOST}" --path=/var/www/html/wordpress  --allow-root --type=constant
    wp config set WP_REDIS_PORT "${WP_REDIS_PORT}"  --path=/var/www/html/wordpress  --allow-root --type=constant
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email  --path=/var/www/html/wordpress --allow-root
    wp user create ${WP_USER} ${WP_USER_EMAIL}  --user_pass=${WP_USER_PASSWORD} --role=author --path=/var/www/html/wordpress --allow-root
    wp plugin install redis-cache --allow-root --path=/var/www/html/wordpress  --activate
    wp config set WP_CACHE true --path=/var/www/html/wordpress  --allow-root --type=constant
    wp redis enable --path=/var/www/html/wordpress --allow-root
fi

exec "$@"


echo "The script is checking if the file "/var/www/html/wordpress/wp-config.php" exists. If it doesn't, it performs a series of WordPress CLI (wp) commands. The commands include downloading WordPress, creating a database configuration, setting Redis related constants, installing WordPress, creating a new user, installing a Redis cache plugin, enabling Redis cache and setting WP_CACHE to true.

The commands require environment variables to be set for database name, user, password, Redis host, port, domain name, WordPress title, admin credentials, new user credentials and email.

Finally, the script executes the command passed as arguments to the script."