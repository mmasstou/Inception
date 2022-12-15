FROM debian:latest

# WORKDIR /nginx
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install -y  nginx
RUN apt-get install -y  openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj="/C=MA/ST=khouribga/O=./CN=mmasstou.42.fr"


COPY ./conf/nginx.conf /etc/nginx/nginx.conf


# COPY ./nginx.conf /etc/nginx/nginx.conf
# COPY ./tools/index.html /usr/share/nginx/html/index.html
COPY ./tools/ /usr/share/nginx/html/
# COPY ./html/ /usr/share/nginx/html/
# COPY ./html/style.css /usr/share/nginx/html/
# COPY ./html/index.html  /usr/share/nginx/html/index.html
CMD ["nginx", "-g", "daemon off;"]