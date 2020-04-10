FROM php:7.3-fpm-alpine3.11

# Add Build Dependencies
RUN apk add --no-cache --virtual .build-deps  \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    bzip2-dev

# Add Production Dependencies
RUN apk add --update --no-cache \
    jpegoptim \
    pngquant \
    optipng \
    icu-dev \
    freetype-dev \
    nginx \
    supervisor

# Configure & Install Extension
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

# Add Composer
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV PATH="./vendor/bin:$PATH"

COPY master.ini /etc/supervisor.d/
COPY default.conf /etc/nginx/conf.d/
#COPY opcache.ini /usr/local/etc/php/conf.d/

# Remove Build Dependencies
RUN apk del -f .build-deps

# Setup Working Dir
WORKDIR /var/www

CMD ["/usr/bin/supervisord"]
