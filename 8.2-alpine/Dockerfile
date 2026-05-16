FROM php:8.2-fpm-alpine3.21

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
    php82-bcmath \
    php82-bz2 \
    php82-calendar \
    php82-exif \
    php82-gd \
    php82-gettext \
    php82-imap \
    php82-intl \
    php82-mysqli \
    php82-opcache \
    php82-pcntl \
    php82-pdo \
    php82-pdo_mysql \
    php82-shmop \
    php82-soap \
    php82-sockets \
    php82-sysvmsg \
    php82-sysvsem \
    php82-sysvshm \
    php82-tidy \
    php82-xsl \
    php82-zip \
    php82-pecl-mongodb \
    php82-pecl-imagick \
    php82-gmp \
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
