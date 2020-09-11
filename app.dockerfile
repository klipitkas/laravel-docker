FROM php:7.3-fpm-alpine

# Add build dependencies
RUN apk add --no-cache --virtual .build-deps  \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    bzip2-dev \
    autoconf \
    openssl-dev \
    build-base

# Add production dependencies
RUN apk add --update --no-cache \
    jpegoptim \
    pngquant \
    optipng \
    icu-dev \
    freetype-dev \
    nginx \
    supervisor

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

# Install the required extensions
RUN docker-php-ext-configure \
    opcache --enable-opcache &&\
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ &&\
    docker-php-ext-install \
    opcache \
    mysqli \
    pdo \
    pdo_mysql \
    sockets \
    json \
    intl \
    gd \
    xml \
    bz2 \
    pcntl \
    bcmath

RUN apk add --no-cache libzip-dev && docker-php-ext-install zip

# Add composer globally
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="./vendor/bin:$PATH"

COPY master.ini /etc/supervisor.d/
COPY default.conf /etc/nginx/conf.d/

# Remove build dependencies for a slim final image
RUN apk del -f .build-deps

# Setup workdir
WORKDIR /var/www

CMD ["/usr/bin/supervisord"]