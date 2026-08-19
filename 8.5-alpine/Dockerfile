FROM php:8.5-fpm-alpine3.23

# 1. Install Extension Installer Script
COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

# 2. Install System Utilities (Linux Tools)
RUN apk update && apk add --no-cache \
    curl \
    git \
    iputils \
    nano \
    unzip \
    zip

# 3. Install ALL PHP Extensions
RUN install-php-extensions \
    bcmath \
    bz2 \
    calendar \
    exif \
    gd \
    gettext \
    gmp \
    imagick \
    imap \
    intl \
    mongodb \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    redis \
    shmop \
    soap \
    sockets \
    sysvmsg \
    sysvsem \
    sysvshm \
    tidy \
    xsl \
    zip

# 4. Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 5. Entrypoint — auto-remaps www-data UID to match mounted volume owner
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
