FROM php:8.4-fpm-alpine3.21

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
    php84-bcmath \
    php84-bz2 \
    php84-calendar \
    php84-exif \
    php84-gd \
    php84-gettext \
    php84-imap \
    php84-intl \
    php84-mysqli \
    php84-opcache \
    php84-pcntl \
    php84-pdo \
    php84-pdo_mysql \
    php84-shmop \
    php84-soap \
    php84-sockets \
    php84-sysvmsg \
    php84-sysvsem \
    php84-sysvshm \
    php84-tidy \
    php84-xsl \
    php84-zip \
    php84-pecl-mongodb \
    php84-pecl-imagick \
    php84-gmp \
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
