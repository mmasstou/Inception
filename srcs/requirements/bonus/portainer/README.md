## Portainer Container

Folder File :

*`Dockerfile`



> Dockerfile :

```
FROM debian:buster
RUN apt update -y && apt upgrade -y && apt install -y curl tar
RUN mkdir -p /var/lib/portainer
RUN curl -sSL https://github.com/portainer/portainer/releases/download/2.16.2/portainer-2.16.2-linux-amd64.tar.gz | tar -xzo -C /usr/local
CMD ["/usr/local/portainer/portainer"]

```
### Dashboard
![Image description](https://github.com/mmasstou/Inception/.img/Dashboard.png)

### stacks
![Image description](https://github.com/mmasstou/Inception/.img/stacks.png)

### images
![Image description](https://github.com/mmasstou/Inception/.img/images.png)

### Containers
![Image description](https://github.com/mmasstou/Inception/.img/Containers.png)

### networks
![Image description](https://github.com/mmasstou/Inception/.img/networks.png)

### volumes
![Image description](https://github.com/mmasstou/Inception/.img/volumes.png)

### Events
![Image description](https://github.com/mmasstou/Inception/.img/Events.png)
