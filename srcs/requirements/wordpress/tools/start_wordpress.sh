if [ ! -f "./wp-config.php" ]; then

wp core download --allow-root

wp config create --allow-root \
   --dbname=$SQL_DATABASE \
   --dbuser=$SQL_USER_LOGIN \
   --dbpass=$SQL_USER_PASSWORD \
   --dbhost=mariadb:3306 \

wp core install --allow-root \
   --url="gurodrig.42.fr" \
   --title=$WP_TITLE \
   --admin_user=$WP_ADMIN_LOGIN \
   --admin_password=$WP_ADMIN_PASSWORD \
   --admin_email=$WP_ADMIN_EMAIL
	
wp user create $WP_USER_LOGIN $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --allow-root;

else
  echo Wordpress already installed
fi

mkdir -p /run/php

php-fpm7.4 -F