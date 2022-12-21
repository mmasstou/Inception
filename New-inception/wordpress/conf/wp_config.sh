#!/bin/bash

echo "Configure Wp ... \n"

# touch /var/www/html/wp-config.php


if [ ! -f /var/www/html/wordpress/wp-config.php ] ; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
    # curl -s https://api.wordpress.org/secret-key/1.1/salt/ >  /var/www/html/wordpress/wp-config.php

            # cp /var/www/html/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php
            # echo "Wordpress: creating users..."
            # wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
            # wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
            echo "Wordpress: set up!"
    # while (1);
fi
exec "$@"