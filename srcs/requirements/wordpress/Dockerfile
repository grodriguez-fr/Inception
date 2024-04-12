FROM debian:buster

ARG 

# installations
RUN apt update -y && \
    apt install -y wget php php-mysqli php-fpm mariadb-client

RUN mkdir -p /var/www/html && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/config.sh /

CMD ["bash", "/config.sh"]
