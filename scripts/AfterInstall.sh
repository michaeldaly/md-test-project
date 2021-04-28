#!/bin/bash


#
# cd /var/www


#
# Copy the environment file from S3 to the local installation
if [[ "$DEPLOYMENT_GROUP_NAME" == "dev-deployment-group" ]]
then
    cp /var/www/builds/md-test-project /var/www/md-test-project
    cd /var/www/md-test-project
    aws s3 cp s3://md-test-project-builds/config-files/dev.env .env
elif [[ "$DEPLOYMENT_GROUP_NAME" == "staging-deployment-group" ]]
then
    cp /var/www/builds/md-test-project /var/www/md-test-project-staging
    cd /var/www/md-test-project-staging
    aws s3 cp s3://md-test-project-builds/config-files/staging.env .env
elif [[ "$DEPLOYMENT_GROUP_NAME" == "production-deployment-group" ]]
then
    cp /var/www/builds/md-test-project /var/www/md-test-project-prod
    cd /var/www/md-test-project-prod
    aws s3 cp s3://md-test-project-builds/config-files/production.env .env
fi


# Set permissions to storage and bootstrap cache
sudo chmod -R 0777 storage
sudo chmod -R 0777 bootstrap/cache


#
# Run composer
# sudo /usr/bin/composer.phar install --no-ansi --no-dev --no-suggest --no-interaction --no-progress --prefer-dist --no-scripts -d /var/www/md-test-project


# Clear any previous cached views and optimize the application
php artisan cache:clear
php artisan view:clear
php artisan optimize
php artisan route:cache
php artisan config:clear


#
# Run artisan commands
# php /var/www/md-test-project/artisan migrate


#
# Start the application
php artisan up