FROM alpine:latest

RUN	apk update && apk upgrade && apk add --no-cache mariadb mariadb-client

COPY tools/configure.sh configure.sh

ENTRYPOINT ["sh", "configure.sh"]
# RUN apt-get update && apt-get upgrade -y

# RUN apt-get install mariadb-server  -y
# RUN apt-get install  -y systemctl

# COPY tools/configure.sh configure.sh

# ENTRYPOINT ["sh", "configure.sh"]

