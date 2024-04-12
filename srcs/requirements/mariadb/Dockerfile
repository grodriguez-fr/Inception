FROM debian:buster

ARG SQL_ROOT_PASSWORD
ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_USER_PASSWORD

# installations
RUN apt update -y && \
    apt-get install -y mariadb-server

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld var/lib/mysql && chmod 777 /run/mysqld && chown mysql:mysql /var/lib/mysql/aria_log_control

COPY tools/start.sh /

RUN bash ./start.sh

CMD [ "mysqld", "--bind-address=0.0.0.0" ]