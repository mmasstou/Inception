#!/bin/bash

echo "Configure Wp ... \n"

# ? Generate secret-key :

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
	chown -R www-data:www-data /var/www/*;
	chown -R 755 /var/www/*;
	mkdir -p /run/php/;
	touch /run/php/php7.3-fpm.pid;
# touch /var/www/html/wp-config.php
if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
	echo "Wordpress: setting up..."
	mkdir -p /var/www/html
	wget https://wordpress.org/nightly-builds/wordpress-latest.zip;

    unzip wordpress-latest.zip

    curl -s https://api.wordpress.org/secret-key/1.1/salt/ >  /var/www/html/wordpress/wp-config-sample.php
    cat << EOF >> /var/www/html/wordpress/wp-config-sample.php

# config Databases : 
define( 'DB_NAME', '$DATABASE_NAME' );
define( 'DB_USER', '$DATABASE_USR' );
define( 'DB_PASSWORD', '$DATABASE_PWD' );
define( 'DB_HOST', 'localhost' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

EOF
            cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php
            echo "Wordpress: creating users..."
            # wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
            # wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
            echo "Wordpress: set up!"
    # while (1);
fi
exec "$@"