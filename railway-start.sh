#!/bin/bash

# Enable error reporting
set -e

echo "=== Railway Laravel Deployment Script ==="

# Install dependencies
echo "Installing Composer dependencies..."
composer install --no-dev --optimize-autoloader

# Check if .env exists, if not create from example
if [ ! -f .env ]; then
    echo "Creating .env file from example..."
    cp .env.example .env
fi

# Generate application key
echo "Generating application key..."
php artisan key:generate --force

# Clear all caches
echo "Clearing caches..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear
php artisan view:clear

# Check environment variables
echo "Checking environment variables..."
php artisan tinker --execute="echo 'APP_KEY: ' . config('app.key') . PHP_EOL; echo 'APP_ENV: ' . config('app.env') . PHP_EOL; echo 'APP_DEBUG: ' . (config('app.debug') ? 'true' : 'false') . PHP_EOL;"

# Test database connection
echo "Testing database connection..."
php artisan tinker --execute="try { DB::connection()->getPdo(); echo 'Database connection successful' . PHP_EOL; } catch (Exception \$e) { echo 'Database connection failed: ' . \$e->getMessage() . PHP_EOL; }"

# Run migrations
echo "Running database migrations..."
php artisan migrate --force

# Create storage link
echo "Creating storage link..."
php artisan storage:link

# Set proper permissions
echo "Setting permissions..."
chmod -R 775 storage bootstrap/cache

# Cache configurations for production
echo "Caching configurations..."
php artisan config:cache
php artisan route:cache
php artisan view:cache

echo "=== Starting Laravel application ==="
php artisan serve --host=0.0.0.0 --port=$PORT 