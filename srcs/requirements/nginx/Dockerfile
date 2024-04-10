FROM debian:buster

# installations
RUN apt update -y && \
    apt upgrade -y && \
    apt install nginx -y && \
    apt install vim -y && \
    apt install openssl -y

# certifcat creation
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/L=Lyon/O=42/OU=42/CN=gurodrig.42.fr/UID=gurodrig" && \
    mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]