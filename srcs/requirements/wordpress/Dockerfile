FROM debian:oldstable

ARG SQL_DATABASE
ARG SAL_USER
ARG SQL_USER_PASSWORD
ARG WP_TITLE
ARG WP_ADMIN_LOGIN
ARG WP_ADMIN_PASSWORD
ARG WP_ADMIN_EMAIL
ARG WP_USER_LOGIN
ARG WP_USER_EMAIL

RUN apt update -y && \
    apt install -y wget php php-mysqli php-fpm

RUN mkdir -p /var/www/html && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/start_wordpress.sh /

CMD ["bash", "/start_wordpress.sh"]
