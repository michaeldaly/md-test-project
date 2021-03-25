#!/bin/bash

# Set permissions to storage and bootstrap cache
sudo chmod -R 0777 /var/www/md-test-project/storage
sudo chmod -R 0777 /var/www/md-test-project/bootstrap/cache

#
cd /var/www/md-test-project

#
# Run composer
# sudo /usr/bin/composer.phar install --no-ansi --no-dev --no-suggest --no-interaction --no-progress --prefer-dist --no-scripts -d /var/www/md-test-project

# Clear any previous cached views and optimize the application
php /var/www/md-test-project/artisan cache:clear
php /var/www/md-test-project/artisan view:clear
php /var/www/md-test-project/artisan config:cache
php /var/www/md-test-project/artisan optimize
php /var/www/md-test-project/artisan route:cache

#
# Run artisan commands
# php /var/www/md-test-project/artisan migrate

#
# Start the application
php artisan up