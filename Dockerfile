FROM php:7.1-apache

MAINTAINER Magefox <magefoxtech@gmail.com>

# Enable mode_rewrite
RUN a2enmod rewrite

# Install php extensions
RUN apt-get update && apt-get install -y \
    zip \
    libcurl3-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libicu-dev \
    libxslt1-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install pdo pdo_mysql gd curl intl mbstring xsl zip bcmath iconv soap

# Install composer
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# Install nodejs
RUN apt-get install -y software-properties-common
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g grunt-cli
