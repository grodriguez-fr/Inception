service mysql start

#SQL_ROOT_PASSWORD="pass"
#SQL_DATABASE="mariadb"
#SQL_USER="user"
#SQL_USER_PASSWORD="user"
#SQL_HOST="mariadb:3306"
#SQL_VOLUME="/var/lib/mysql"

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
mysql -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

