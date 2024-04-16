FROM debian:oldstable

# installations
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install nginx -y && \
    apt-get install openssl -y

# certifcat creation
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -newkey rsa \
    -out    /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/L=Lyon/CN=gurodrig.42.fr/UID=gurodrig"

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf


RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf

RUN chmod 777 /var/www/html

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]