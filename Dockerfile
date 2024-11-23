FROM php:8.1-fpm
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    libpq-dev \
    libzip-dev \
    libonig-dev \
    libxml2-dev \
    curl \
    zip \
    libpng-dev \
    && docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath gd
COPY --from=composer:2.5 /usr/bin/composer /usr/bin/composer
WORKDIR /var/www
COPY . .
