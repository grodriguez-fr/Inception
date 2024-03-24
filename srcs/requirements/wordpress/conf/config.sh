#!/bin/bash
#sleep 10

wp config create --dbname=${MYSQL_DATABASE} \
   --dbuser=${MYSQL_USER_FOR_WORDPRESS} \
   --dbpass=${MYSQL_ROOT_PASSWORD} \
   --dbhost=${MYSQL_HOST} --allow-root \
   --path='/var/www/wordpress'