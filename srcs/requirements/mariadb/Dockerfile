FROM debian:buster

ARG SQL_ROOT_PASSWORD
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_USER_PASSWORD

RUN apt update -y && \
    apt-get install -y mariadb-server

# RUN mkdir -p /run/mysqld var/lib/mysql && chmod 777 /run/mysqld && chown mysql:mysql /var/lib/mysql/aria_log_control

RUN echo ${SQL_DATABASE}

RUN service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"\
                        && mariadb -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"\
                        && mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"\
                        && mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" \
                        && mariadb -e "FLUSH PRIVILEGES;"

CMD [ "mariadbd", "--bind-address=0.0.0.0"]