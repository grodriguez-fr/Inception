FROM debian:buster

ARG SQL_ROOT_PASSWORD
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_USER_PASSWORD

RUN apt update -y && \
    apt-get install -y mariadb-server

RUN mkdir -p /run/mysqld var/lib/mysql && chmod 777 /run/mysqld && chown mysql:mysql /var/lib/mysql/aria_log_control

RUN service mysql start && \
    mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" && \
    mysql -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" && \
    mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO ${SQL_USER}@'%';" && \
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && \
    mysql -e "FLUSH PRIVILEGES;"

CMD [ "mysqld", "--bind-address=0.0.0.0", "--port=3306" ]