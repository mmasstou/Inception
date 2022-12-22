FROM wordpress:php7.4-fpm-alpine

# Install additional PHP extensions
RUN set -ex; \
    apk add --no-cache \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        zlib-dev; \
    docker-php-ext-configure gd --with-jpeg; \
    docker-php-ext-install -j "$(nproc)" \
        gd \
        mysqli \
        zip

# Configure the Nginx web server
COPY config/nginx.conf /etc/nginx/nginx.conf

# Set the WordPress uploads directory to be writable
RUN chown -R www-data:www-data /var/www/html/wp-content/uploads