#!/bin/bash
set -e

# Wait for database to be ready (optional, helpful for local testing)
echo "Waiting for database connection..."
sleep 3

# Run Laravel artisan commands
echo "Running Laravel setup commands..."

# Cache Laravel configuration for better performance
php artisan config:cache
php artisan route:cache
php artisan view:cache

# Run migrations (only if database is ready)
if [ "$APP_ENV" != "local" ]; then
    echo "Running database migrations..."
    php artisan migrate --force --no-interaction || echo "Migration failed or already run"
fi

# Create storage link if it doesn't exist
php artisan storage:link || echo "Storage link already exists"

echo "Laravel application ready!"

# Execute the main container command
exec "$@"
