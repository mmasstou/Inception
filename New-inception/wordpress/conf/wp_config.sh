#!/bin/bash

echo "Configure Wp ... \n"

# touch /var/www/html/wp-config.php

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    echo "Wordpress: setting up..."
    mkdir -p /var/www/html
    touch /var/www/html/wordpress/wp-config.php

    chmod +x /var/www/html/wordpress/wp-config.php
    # curl -s https://api.wordpress.org/secret-key/1.1/salt/ >  /var/www/html/wordpress/wp-config.php

    # cp /var/www/html/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php
    # echo "Wordpress: creating users..."
    # wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
    # wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
    cat <<EOF >/var/www/html/wordpress/wp-config.php

<?php
// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', '$DATABASE_NAME' );

/** Database username */
define( 'DB_USER', '$DATABASE_USER' );

/** Database password */
define( 'DB_PASSWORD', '$DATABASE_PWD' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';


EOF
    curl -s https://api.wordpress.org/secret-key/1.1/salt/ >>  /var/www/html/wordpress/wp-config.php
    echo "Wordpress: wp config  setted succesful!"
    # while (1);
fi
exec "$@"
