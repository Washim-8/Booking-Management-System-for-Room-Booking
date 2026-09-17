#!/bin/bash
set -e

# Support dynamic PORT configuration provided by Render or container environment
if [ -n "$PORT" ] && [ "$PORT" != "80" ]; then
    echo "Configuring Apache to listen on port $PORT..."
    sed -i "s/Listen 80/Listen $PORT/g" /etc/apache2/ports.conf
    sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:$PORT>/g" /etc/apache2/sites-available/*.conf
fi

# Ensure all storage and cache directories exist with proper permissions
mkdir -p storage/framework/cache/data storage/framework/sessions storage/framework/views storage/logs bootstrap/cache
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache

# Wait for database connection if configured
if [ -n "$DATABASE_URL" ] || [ -n "$DB_HOST" ]; then
    echo "Waiting for database connection..."
    sleep 3
fi

# Run Laravel setup & optimization commands
echo "Running Laravel setup commands..."
php artisan config:cache || echo "Config cache skipped"
php artisan route:cache || echo "Route cache skipped"
php artisan view:cache || echo "View cache skipped"

# Run migrations safely in production (non-destructive)
if [ "$APP_ENV" != "local" ]; then
    echo "Running database migrations..."
    php artisan migrate --force --no-interaction || echo "Migration failed or already run"
fi

# Create storage link if it doesn't exist
php artisan storage:link || echo "Storage link already exists"

# Start background keep-alive ping loop for Render free-tier anti-sleep
if [ -n "$RENDER_EXTERNAL_URL" ] || [ -n "$APP_URL" ]; then
    (
        TARGET_URL="${RENDER_EXTERNAL_URL:-$APP_URL}"
        PING_URL="${TARGET_URL%/}/health"
        echo "[KeepAlive] Background keep-alive daemon started for ${PING_URL} (pings every 10 min)"
        # Wait 30s so Apache has completely bound to port and is accepting traffic
        sleep 30
        while true; do
            STATUS=$(curl -s -o /dev/null -w "%{http_code}" "$PING_URL" 2>/dev/null || echo "000")
            echo "[KeepAlive] Self-ping to ${PING_URL} -> HTTP ${STATUS} at $(date)"
            sleep 600
        done
    ) &
fi

echo "Laravel application ready!"

# Execute the main container command
exec "$@"

