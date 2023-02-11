## Adminer Container

Folder File :

* `Dockerfile`

> Dockerfile : 

```
FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y php  wget  php-mysql

WORKDIR /var/www/html/wordpress
RUN wget https://www.adminer.org/static/download/4.8.1/adminer-4.8.1.php
RUN mv adminer-4.8.1.php index.php
EXPOSE 8080

CMD [ "php", "-S", "[::]:8080 ssl" , "-t", "/var/www/html/wordpress" ]


```

![Image description](https://github.com/mmasstou/Inception/blob/master/.img/adminer.png)
