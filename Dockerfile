# Use PHP 8.2 with Apache
FROM php:8.2-apache

# Set working directory early
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

# Install PHP extensions required for Laravel with PostgreSQL
RUN docker-php-ext-install pdo pdo_pgsql pgsql mbstring exif pcntl bcmath gd zip

# Enable Apache mod_rewrite for Laravel routing
RUN a2enmod rewrite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set Composer environment variables
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1

# Copy composer files first (for better layer caching)
COPY composer.json composer.lock ./

# Install PHP dependencies with platform checks ignored
RUN composer install \
    --no-dev \
    --no-scripts \
    --no-autoloader \
    --no-interaction \
    --prefer-dist \
    --ignore-platform-req=php \
    --ignore-platform-req=ext-* \
    || composer update --no-dev --no-scripts --no-autoloader --no-interaction --prefer-dist --ignore-platform-req=php --ignore-platform-req=ext-*

# Copy application files
COPY . .

# Complete composer setup
RUN composer dump-autoload --no-dev --optimize --classmap-authoritative

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

# Configure Apache DocumentRoot to point to Laravel's public directory
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy the startup script
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Expose port 80
EXPOSE 80

# Use custom entrypoint
ENTRYPOINT ["docker-entrypoint.sh"]

# Start Apache
CMD ["apache2-foreground"]
