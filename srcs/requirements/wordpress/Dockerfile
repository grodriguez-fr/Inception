FROM debian:oldstable

RUN apt-get update -y && \
    apt-get upgrade && \
    apt-get install -y wget php php-mysql php-fpm sendmail

RUN mkdir -p /var/www/html && \
    wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY tools/start_wordpress.sh /

EXPOSE 9000

CMD ["sh", "/start_wordpress.sh"]
