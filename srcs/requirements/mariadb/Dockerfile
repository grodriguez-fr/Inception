FROM debian:oldstable

ARG SQL_ROOT_PASSWORD
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_USER_PASSWORD

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

RUN service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"
RUN service mariadb start && mariadb -e "CREATE USER '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';"
RUN service mariadb start && mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%';"
RUN service mariadb start && mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';" && mariadb -e "FLUSH PRIVILEGES;"

CMD [ "mariadbd", "--bind-address=0.0.0.0"]