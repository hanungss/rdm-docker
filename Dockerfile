FROM php:7.2-apache

# Install extensions
RUN apt-get update && apt-get install -y \
    libzip-dev zip unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev \
    && docker-php-ext-install mysqli pdo pdo_mysql mbstring gd zip

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Copy ionCube loader
COPY ioncube/ioncube_loader_lin_7.2.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/

# Enable ionCube
RUN echo "zend_extension=ioncube_loader_lin_7.2.so" > /usr/local/etc/php/conf.d/00-ioncube.ini
