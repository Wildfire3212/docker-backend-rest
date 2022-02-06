FROM php:7.4.3-apache
RUN apt update \
        && apt install -y \
            g++ \
            libicu-dev \
            libpq-dev \
            libzip-dev \
            zip \
            zlib1g-dev \
            git \
            nano \
        && docker-php-ext-install \
            intl \
            opcache \
            pdo \
            pdo_mysql \
            mysqli 

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /var/www
RUN     git clone https://github.com/Wildfire3212/api-rest-laravel.git
WORKDIR /var/www/api-rest-laravel
RUN composer update \
        && composer install \
        && cp .env.example .env \
        && php artisan key:generate \
        && php artisan route:clear \
        && a2enmod rewrite 