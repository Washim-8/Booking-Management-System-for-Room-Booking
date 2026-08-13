# Use official PHP 8.2 Apache image
FROM php:8.2-apache

WORKDIR /var/www/html

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libpq-dev \
    libzip-dev \
    zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip

# Get latest Composer
COPY --from=composer:2.7 /usr/bin/composer /usr/bin/composer

# Copy application
COPY . .

# Install dependencies without scripts first
RUN COMPOSER_ALLOW_SUPERUSER=1 composer install --no-dev --no-scripts --no-interaction --prefer-dist

# Run post-install scripts
RUN COMPOSER_ALLOW_SUPERUSER=1 composer run-script post-autoload-dump --no-interaction || true

# Optimize
RUN COMPOSER_ALLOW_SUPERUSER=1 composer dump-autoload --optimize --classmap-authoritative --no-interaction

# Set permissions
RUN chown -R www-data:www-data storage bootstrap/cache \
    && chmod -R 775 storage bootstrap/cache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Configure Apache document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf \
    && sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy and set up entrypoint
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 80

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
