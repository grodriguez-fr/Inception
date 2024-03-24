FROM debian:buster

# installations
RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
RUN apt-get install mariadb-server -y

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/start.sh /
RUN chmod +x /start.sh
CMD [ "./start.sh" ]