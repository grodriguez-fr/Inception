wp core download --allow-root

wp config create --dbname=${SQL_DATABASE} \
   --dbuser=${SQL_USER} \
   --dbpass=${SQL_USER_PASSWORD} \
   --dbhost=mariadb:3306 --allow-root \
   --path='/var/www/wordpress'

wp core install --allow-root \
   --url=gurodrig.42.fr \
   --title=${WP_TITLE} \
   --admin_user=$WP_ADMIN_LOGIN \
   --admin_password=$WP_ADMIN_PASSWORD \
   --admin_email=$WP_ADMIN_EMAIL
	

wp user create --allow-root \
   ${WP_USER_LOGIN} \
   ${WP_USER_EMAIL} \
   --user_pass=${WP_USER_PASSWORD};

/usr/sbin/php-fpm7.4 --nodaemonize