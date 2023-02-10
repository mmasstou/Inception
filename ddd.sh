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