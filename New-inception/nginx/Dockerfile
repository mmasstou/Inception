FROM debian:buster

RUN apt-get update && apt-get install -y nginx

# COPY tools/nginx.conf /etc/nginx/nginx.conf
COPY tools/nginx.conf /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]