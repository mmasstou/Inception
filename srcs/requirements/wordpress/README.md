# WordPress Container

The WordPress container contains WordPress and php-fpm, installed and configured without NGINX.

Folder File :

* `conf/www.conf`
* `tools/wp_config.sh`
* `Dockerfile`

> conf/www.conf

```
[www]

listen = wordpress:9000
user = www-data
group = www-data
pm = dynamic
pm.start_servers = 6
pm.max_children = 25
pm.min_spare_servers = 2
pm.max_spare_servers = 10
```

This is a configuration block for PHP-FPM (FastCGI Process Manager), which is a server for executing PHP scripts in response to web requests. The configuration block sets the following parameters : 

1. `listen`: This parameter specifies the address and port number where PHP-FPM should listen for incoming FastCGI requests. In this case, it is set to `wordpress:9000`, meaning that PHP-FPM will listen on the "wordpress" hostname on port 9000.
2. `user`: This parameter sets the user under which PHP-FPM will run. In this case, it is set to `www-data`, which is a common user for web server processes on Debian-based systems.
3. `group`: This parameter sets the group under which PHP-FPM will run. In this case, it is set to `www-data`, which is a common group for web server processes on Debian-based systems.
4. `pm`: This parameter sets the process manager type used by PHP-FPM. In this case, it is set to `dynamic`, meaning that PHP-FPM will dynamically manage the number of child processes based on the requests it receives.
5. `pm.start_servers`: This parameter sets the number of child processes to start when PHP-FPM starts. In this case, it is set to 6.
6. `pm.max_children`: This parameter sets the maximum number of child processes that can be created by PHP-FPM. In this case, it is set to 25.
7. `pm.min_spare_servers`: This parameter sets the minimum number of idle child processes that PHP-FPM should maintain. In this case, it is set to 2.
8. `pm.max_spare_servers`: This parameter sets the maximum number of idle child processes that PHP-FPM should maintain. In this case, it is set to 10.

> tools/wp_config.sh

```
#!/bin/bash

echo "WP -- Configuration"

if [ ! -f /var/www/html/wordpress/wp-config.php ]; then
    echo "WP -- '/var/www/html/wordpress/wp-config.php' file does not exist"
    echo "WP --  download wordpress files"
    wp core download --allow-root --path=/var/www/html/wordpress
    # We create a new wp-config.php file (= wordpress configuration file) with MYSQL_USER
    # echo "Wordpress: We install WordPress with WORDPRESS_ADMIN_USER"
    echo "WP --  Create '/var/www/html/wordpress/wp-config.php' file "
    wp config create --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PWD} --dbhost=mariadb --path=/var/www/html/wordpress  --allow-root
    echo "WP --  set Redis Vars"
    wp config set WP_REDIS_HOST "${WP_REDIS_HOST}" --path=/var/www/html/wordpress  --allow-root --type=constant
    wp config set WP_REDIS_PORT "${WP_REDIS_PORT}"  --path=/var/www/html/wordpress  --allow-root --type=constant
    # We install WordPress with WORDPRESS_ADMIN_USER
    echo "WP --  install WordPress with $WP_ADMIN"
    wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email  --path=/var/www/html/wordpress --allow-root
    # We create a wordpress simple user
    echo "WP --  create a wordpress user : $WP_USER"
    wp user create ${WP_USER} ${WP_USER_EMAIL}  --user_pass=${WP_USER_PASSWORD} --role=author --path=/var/www/html/wordpress --allow-root
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
```

`if [ ! -f /var/www/html/wordpress/wp-config.php ]; then ` : The script is checking if the file "/var/www/html/wordpress/wp-config.php" exists. If it doesn't, it performs a series of WordPress CLI (wp) commands

`wp core download --allow-root --path=/var/www/html/wordpress` : downloading WordPress

`wp config create --dbname=${DATABASE_NAME} --dbuser=${DATABASE_USER} --dbpass=${DATABASE_PWD} --dbhost=mariadb --path=/var/www/html/wordpress  --allow-root ` : creating a database configuration

` wp config set WP_REDIS_HOST "${WP_REDIS_HOST}" --path=/var/www/html/wordpress  --allow-root --type=constant     wp config set WP_REDIS_PORT "${WP_REDIS_PORT}"  --path=/var/www/html/wordpress  --allow-root --type=constant` : setting Redis related constants

`wp core install --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${WP_ADMIN} --admin_password=${WP_ADMIN_PASSWORD} --admin_email=${WP_ADMIN_EMAIL} --skip-email  --path=/var/www/html/wordpress --allow-root ` : installing WordPress

`wp user create ${WP_USER} ${WP_USER_EMAIL}  --user_pass=${WP_USER_PASSWORD} --role=author --path=/var/www/html/wordpress --allow-root ` : creating a new user

`wp plugin install redis-cache --allow-root --path=/var/www/html/wordpress  --activate` : installing a Redis cache plugin

`wp redis enable --path=/var/www/html/wordpress --allow-root ` : enabling Redis cache

`wp config set WP_CACHE true --path=/var/www/html/wordpress  --allow-root --type=constant ` : setting WP_CACHE to true

`exec "$@" ` : the script runs the command passed as an argument in `CMD`

> Dockerfile :

```
FROM debian:buster
RUN apt-get update && apt-get install -y mariadb-server \
    php \
    php-fpm \
    php-mysql \
    wget \
    unzip \
    curl
# install Wordpress CLI and put in the Folder : /usr/local/bin/wp
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# create /run/php :
# create /var/www/html : 
RUN mkdir /run/php && mkdir -p /var/www/html && chmod +x /var/www/html
# copy the script to `/tmp/` to execute in container  and www.conf to `/etc/php/7.3/fpm/pool.d/` to update the config of fpm
COPY ./tools/wp_config.sh  /tmp/wp_config.sh
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chmod +x /tmp/wp_config.sh 


ENTRYPOINT [ "/tmp/wp_config.sh"]

CMD ["php-fpm7.3", "-F"]
```

* `FROM debian:buster ` : The image is based on the latest version of Debian Buster.
* `RUN apt-get update && apt-get install -y mariadb-server \ php \ php-fpm \ php-mysql \ wget \ unzip \ curl ` : The `RUN` command updates the package list and installs the necessary packages for running a PHP-FPM and MariaDB setup, including PHP, MariaDB server, PHP-MySQL, wget, unzip, and curl.
* `RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp ` : The `RUN` command also installs the WordPress CLI and puts it in the `/usr/local/bin` folder.
* `RUN mkdir /run/php && mkdir -p /var/www/html && chmod +x /var/www/html ` : The `RUN` command creates the necessary directories `/run/php` and `/var/www/html`, and sets the proper permissions.
* `COPY ./tools/wp_config.sh  /tmp/wp_config.sh ` `COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf` : The `COPY` command copies a shell script `wp_config.sh` and a PHP-FPM pool configuration file `www.conf` to the container.
* `RUN chmod +x /tmp/wp_config.sh ` : The `RUN` command makes the shell script executable.
* `ENTRYPOINT [ "/tmp/wp_config.sh"] ` : The `ENTRYPOINT` directive specifies the shell script to be executed when the container is started.
* `CMD ["php-fpm7.3", "-F"] ` : The `CMD` command starts the PHP-FPM process in the foreground.
