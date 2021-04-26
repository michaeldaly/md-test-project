#!/bin/bash

# cd /var/www/md-test-project

if [[ "$DEPLOYMENT_GROUP_NAME" == "dev-deployment-group" ]]
then
    cd /var/www/md-test-project
elif [[ "$DEPLOYMENT_GROUP_NAME" == "staging-deployment-group" ]]
then
    cd /var/www/md-test-project-staging
elif [[ "$DEPLOYMENT_GROUP_NAME" == "production-deployment-group" ]]
then
    cd /var/www/md-test-project-prod
fi

#
# Stop the application
if [ -f "artisan" ]; then
    php artisan down
fi
