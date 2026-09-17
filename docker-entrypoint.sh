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

# Start background keep-alive ping loop for Render free-tier anti-sleep
if [ -n "$RENDER_EXTERNAL_URL" ] || [ -n "$APP_URL" ]; then
    (
        TARGET_URL="${RENDER_EXTERNAL_URL:-$APP_URL}"
        PING_URL="${TARGET_URL%/}/healthz"
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
