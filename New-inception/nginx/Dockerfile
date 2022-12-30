FROM debian:buster

RUN apt-get update && apt-get install -y nginx


RUN apt-get install -y  openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/C=MA/ST=rabat/O=./CN=mmasstou.42.fr"
# COPY tools/nginx.conf /etc/nginx/nginx.conf


COPY tools/nginx.conf /etc/nginx/sites-available/default


RUN mkdir -p /var/www/html/static

COPY ../static /var/www/html/static

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]