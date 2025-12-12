FROM php:8.5-fpm-alpine3.23

RUN apk update && apk add --no-cache \
    autoconf \
    bzip2-dev \
    curl-dev \
    freetype-dev \
    g++ \
    gettext-dev \
    icu-dev \
    imagemagick-dev \
    imap-dev \
    krb5-dev \
    libc-dev \
    libedit-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libwebp-dev \
    libxpm-dev \
    libzip-dev \
    linux-headers \
    make \
    oniguruma-dev \
    openldap-dev \
    openssl \
    pcre-dev \
    tidyhtml-dev \
    zlib-dev \
    libxslt-dev \
    gmp-dev \
    php85-bcmath \
    php85-bz2 \
    php85-calendar \
    php85-exif \
    php85-gd \
    php85-gettext \
    php85-imap \
    php85-intl \
    php85-mysqli \
    php85-opcache \
    php85-pcntl \
    php85-pdo \
    php85-pdo_mysql \
    php85-shmop \
    php85-soap \
    php85-sockets \
    php85-sysvmsg \
    php85-sysvsem \
    php85-sysvshm \
    php85-tidy \
    php85-xsl \
    php85-zip \
    php85-pecl-mongodb \
    php85-pecl-imagick \
    php85-gmp \
    nano \
    iputils \
    git

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# chmod www to www-data
RUN chown -R www-data:www-data /var/www

# Clean up
RUN rm -rf /var/cache/apk/*
