# NGINX Container

The NGINX container contains the NGINX web server with TLSv1.2 or TLSv1.3 only.

Folder File :

* `conf/nginx.conf`
* `Dockerfile`

INSTALL :

```
FROM debian:buster

RUN apt-get update && apt-get install -y nginx openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/mmasstou.key -out /etc/ssl/certs/mmasstou.crt -subj="/C=MA/ST=rabat/O=./CN=mmasstou.42.fr"
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
```

* `FROM debian:buster ` : The image is based on the latest version of Debian Buster.
* `RUN apt-get update && apt-get install -y nginx openssl ` : The `RUN` command updates the package list and installs Nginx and OpenSSL.
* `RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/mmasstou.key -out /etc/ssl/certs/exemple.crt -subj="/C=MA/ST=rabat/O=./CN=exemple.42.fr" ` : The `RUN` command generates a self-signed SSL certificate for use with the Nginx server.
* `EXPOSE 443 ` : The `EXPOSE` directive specifies that the Nginx server will listen on port 443.
* `CMD ["nginx", "-g", "daemon off;"] ` : The `CMD` command starts the Nginx server in the foreground.
