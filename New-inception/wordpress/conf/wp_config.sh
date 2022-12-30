#!/bin/bash

echo "Configure Wp ... \n"

# touch /var/www/html/wp-config.php
echo "Install Werdpress CLI  ... \n"
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    echo "Wordpress: setting up..."
    mkdir -p /var/www/html
    # touch /var/www/html/wordpress/wp-config.php
    rm -rf /var/www/html/wordpress/wp-config.php
    # chmod +x /var/www/html/wordpress/wp-config.php
    # curl -s https://api.wordpress.org/secret-key/1.1/salt/ >  /var/www/html/wordpress/wp-config.php
    wp config create \
        --dbname=${DATABASE_NAME} \
        --dbuser=${DATABASE_USER} \
        --dbpass=${DATABASE_PWD} \
        --dbhost=mariadb \
        --path=/var/www/html/wordpress \
        --allow-root

    # cp /var/www/html/wordpress/wp-config.php /var/www/html/wordpress/wp-config.php
    # echo "Wordpress: creating users..."
    # wp core install --allow-root --url=${WP_URL} --title=${WP_TITLE} --admin_user=${WP_ADMIN_LOGIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}
    # wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};

    # curl -s https://api.wordpress.org/secret-key/1.1/salt/ >>  /var/www/html/wordpress/wp-config.php
    # while (1);

fi

# We create a new wp-config.php file (= wordpress configuration file) with MYSQL_USER
echo "Wordpress: We install WordPress with WORDPRESS_ADMIN_USER"

# We install WordPress with WORDPRESS_ADMIN_USER
# wp core install \
#     --url=${DOMAIN_NAME} \
#     --title=${WP_TITLE} \
#     --admin_user=${WP_ADMIN} \
#     --admin_password=${WP_ADMIN_PASSWORD} \
#     --admin_email=${WP_ADMIN_EMAIL} \
#     --skip-email \
#     --path=/var/www/html/wordpress \
#     --allow-root
echo "Wordpress: We create a wordpress simple user"

# We create a wordpress simple user
# wp user create \
#     ${WP_USER} \
#     ${WP_USER_EMAIL} \
#     --user_pass=${WP_USER_PASSWORD} \
#     --role=author \
#     --path=/var/www/html/wordpress \
#     --allow-root
echo "Wordpress: We install a theme 'inspiro'"

# We install a theme
# wp theme install "inspiro" --activate  --path=/var/www/html/wordpress --allow-root


# We generate an article
# wp post generate \
#     --count=1 \
#     --post_author="${WP_USER}" \
#     --post_title="Welcome to my project !" \
#     --path=/var/www/html/wordpress \
#     --allow-root

echo "Wordpress: wp config  setted succesful!"
exec "$@"
