FROM debian:buster

# installations
RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y && \
    apt install vim -y && \
    apt install wget -y
# wordpress
RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client && \
    wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www && \
    cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz && \
    chown -R root:root /var/www/wordpress
# wordpress cli
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY conf/config.sh /
RUN chmod +x /config.sh
ENTRYPOINT ["/config.sh"]