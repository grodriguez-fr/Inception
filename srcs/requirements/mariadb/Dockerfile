FROM debian:oldstable

ARG SQL_ROOT_PASSWORD
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_USER_PASSWORD

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y mariadb-server

RUN service mariadb start && mariadb -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};" \
					&& mariadb -e "CREATE USER '${SQL_USER_LOGIN}'@'%' IDENTIFIED BY '${SQL_USER_PASSWORD}';" \
					&& mariadb -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER_LOGIN}'@'%';" \
                    && mariadb -e "FLUSH PRIVILEGES;" \
					&& mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

EXPOSE 3306

CMD [ "mariadbd", "--bind-address=0.0.0.0" ]