#!/bin/bash

echo "WP -- Configuration"

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
   echo "WP -- '/var/www/html/wordpress/wp-config.php' file does not exist"
    echo "WP --  download wordpress files"

    wp core download --allow-root --path=/var/www/html/wordpress
    # We create a new wp-config.php file (= wordpress configuration file) with MYSQL_USER
    # echo "Wordpress: We install WordPress with WORDPRESS_ADMIN_USER"
    echo "WP --  Create '/var/www/html/wordpress/wp-config.php' file "

    wp config create \
            --dbname=${DATABASE_NAME} \
            --dbuser=${DATABASE_USER} \
            --dbpass=${DATABASE_PWD} \
            --dbhost=mariadb \
            --path=/var/www/html/wordpress \
            --allow-root
    echo "WP --  set Redis Vars"

    wp config set WP_REDIS_HOST "${WP_REDIS_HOST}" --path=/var/www/html/wordpress  --allow-root --type=constant
    wp config set WP_REDIS_PORT "${WP_REDIS_PORT}"  --path=/var/www/html/wordpress  --allow-root --type=constant

    # We install WordPress with WORDPRESS_ADMIN_USER
    echo "WP --  install WordPress with $WP_ADMIN"

    wp core install \
        --url=${DOMAIN_NAME} \
        --title=${WP_TITLE} \
        --admin_user=${WP_ADMIN} \
        --admin_password=${WP_ADMIN_PASSWORD} \
        --admin_email=${WP_ADMIN_EMAIL} \
        --skip-email \
        --path=/var/www/html/wordpress \
        --allow-root

    # We create a wordpress simple user
    echo "WP --  create a wordpress user : $WP_USER"
    wp user create \
        ${WP_USER} \
        ${WP_USER_EMAIL} \
        --user_pass=${WP_USER_PASSWORD} \
        --role=author \
        --path=/var/www/html/wordpress \
        --allow-root
    # echo "Wordpress: We install a theme 'inspiro'"
    echo "WP --  install  Redis-cache"
    wp plugin install redis-cache --allow-root --path=/var/www/html/wordpress  --activate
    echo "WP --  set WP_CACHE true in config file"
    wp config set WP_CACHE true --path=/var/www/html/wordpress  --allow-root --type=constant
    echo "WP --  end of configrations"
    echo "WP --  Enable redis"
    wp redis enable --path=/var/www/html/wordpress --allow-root
fi


exec "$@"
