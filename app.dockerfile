FROM php:7.2-fpm

RUN apt-get update

RUN apt-get install -y libmcrypt-dev \
    git \
    mariadb-server \
    libmagickwand-dev --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install gd \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable gd

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
