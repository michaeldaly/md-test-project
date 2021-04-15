#!/bin/bash

cd /var/www/md-test-project

#
# Stop the application
if [ -f "artisan" ]; then
    php artisan down
fi
