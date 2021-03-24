#!/bin/bash

# Set permissions to storage and bootstrap cache
sudo chmod -R 0777 /var/www/md-test-project/storage
sudo chmod -R 0777 /var/www/md-test-project/bootstrap/cache

#
cd /var/www/md-test-project

#
# Run composer
sudo /usr/bin/composer.phar install --no-ansi --no-dev --no-suggest --no-interaction --no-progress --prefer-dist --no-scripts -d /var/www/md-test-project

#
# Run artisan commands
php /var/www/md-test-project/artisan migrate