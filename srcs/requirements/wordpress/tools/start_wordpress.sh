wp core download --allow-root

wp config create --allow-root \
   --dbname=$SQL_DATABASE \
   --dbuser=$SQL_USER \
   --dbpass=$SQL_USER_PASSWORD \
   --dbhost=mariadb:3306 \

wp core install --allow-root \
   --url="gurodrig.42.fr" \
   --title=$WP_TITLE \
   --admin_user=$WP_ADMIN_LOGIN \
   --admin_password=$WP_ADMIN_PASSWORD \
   --admin_email=$WP_ADMIN_EMAIL
	
echo $WP_USER
echo $WP_USER_EMAIL
echo $WP_USER_PASSWORD
echo user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root;
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root;

mkdir -p /run/php

/usr/sbin/php-fpm7.4 --nodaemonize