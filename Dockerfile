FROM php:7.4-fpm-alpine
MAINTAINER dieKeuleCT<koehlmeier@gmail.com>

# install some extensions for PHP and PHP Compilation
RUN apk --update add wget \
    curl \
    git \
    grep \
    libjpeg \
    libpng \
    libzip \
    tar \
    re2c \
    bison \
    bash \
    gmp-dev \
    libmcrypt-dev \
    freetype-dev \
    libxpm-dev \
    libwebp-dev \
    libjpeg-turbo-dev \
    bzip2-dev \
    openssl-dev \
    krb5-dev \
    libxml2-dev \
    gettext-dev \
    libxslt-dev \
    curl-dev \
    libzip-dev \
    libpng-dev \
    zip \
    

RUN docker-php-source extract \
    && docker-php-ext-install -j$(nproc) xml xmlrpc bcmath bz2 ctype curl gd gettext hash iconv json mbstring mysqli opcache pcntl pdo pdo_mysql phar posix zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-source delete

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
    
#    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
#    && docker-php-ext-install -j$(nproc) gd \


# cleanup - removing dev libraries and install non-dev
RUN apk del gcc \
    make \
    g++ \
    build-base \
    git \
    perl \
    autoconf

RUN rm /var/cache/apk/*
