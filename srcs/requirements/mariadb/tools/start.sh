service mysql start

#SQL_ROOT_PASSWORD="pass"
#SQL_DATABASE="mariadb"
#SQL_USER="user"
#SQL_USER_PASSWORD="user"
#SQL_HOST="mariadb:3306"
#SQL_VOLUME="/var/lib/mysql"

mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -u root -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

while ! mysqladmin ping -h"localhost" --silent; do
    sleep 1
done
