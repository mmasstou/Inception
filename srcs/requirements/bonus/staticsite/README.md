## Static site Container

Folder File :

* `conf/nginx.conf`
* `tools/index.html`
* `tools/mmasstou.png`
* `tools/style.css`
* `Dockerfile`
> conf/nginx.conf : 

```
server {
	listen 8000;
	listen [::]:8000;
	server_name  mmasstou.42.fr;
	root /var/www/html;
	index index.html;
}

```

> Dockerfile : 

```
FROM debian:buster

RUN apt update -y && apt upgrade -y && apt install -y nginx

RUN mkdir -p  /var/www/html
COPY ./tools/ /var/www/html/

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
EXPOSE 8000
CMD [ "nginx", "-g", "daemon off;" ]

```

![Image description](https://github.com/mmasstou/Inception/staticsite.png)
