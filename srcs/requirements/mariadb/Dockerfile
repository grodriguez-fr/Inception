FROM debian:buster

# installations
RUN apt update -y && \
    apt-get install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld var/lib/mysql && chmod 777 /run/mysqld && chown mysql:mysql /var/lib/mysql/aria_log_control

COPY tools/start.sh /
CMD [ "bash", "start.sh" ]
CMD [ "mysqld" ]