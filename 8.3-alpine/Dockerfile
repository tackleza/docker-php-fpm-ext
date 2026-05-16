FROM php:8.3-fpm-alpine3.21

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
    php83-bcmath \
    php83-bz2 \
    php83-calendar \
    php83-exif \
    php83-gd \
    php83-gettext \
    php83-imap \
    php83-intl \
    php83-mysqli \
    php83-opcache \
    php83-pcntl \
    php83-pdo \
    php83-pdo_mysql \
    php83-shmop \
    php83-soap \
    php83-sockets \
    php83-sysvmsg \
    php83-sysvsem \
    php83-sysvshm \
    php83-tidy \
    php83-xsl \
    php83-zip \
    php83-pecl-mongodb \
    php83-pecl-imagick \
    php83-gmp \
    nano \
    iputils \
    git

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Clean up
RUN rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
