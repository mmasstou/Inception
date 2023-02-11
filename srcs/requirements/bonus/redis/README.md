## Redis Container

redis cache for your WordPress website in order to properly manage the cache

Folder File :

* `Dockerfile`

> Dockerfile :

```
FROM debian:buster


RUN apt-get update  && apt-get install -y redis-server
# * bind wordpress ::1 
# * IPV4 : wordpress
# * IPV6 : ::1
# * - is for not listening => Redis shuld not listen to IPV6

RUN sed -i "s|bind 127.0.0.1 ::1|bind wordpress ::1|g" /etc/redis/redis.conf
# * set the max memory for Redis to use : maxmemory 150mb
RUN sed -i "s|# maxmemory <bytes>|maxmemory 150mb|g" /etc/redis/redis.conf
# * The "allkeys-lru" policy tells Redis to evict the least recently used (LRU) key from memory when it runs out of memory
RUN sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lru|g" /etc/redis/redis.conf
# * change the prot to listen 
# RUN sed -i "s|port 6379|port 4545|g" /etc/redis/redis.conf

#  * protected-mode yes
# RUN sed -i "s|protected-mode yes|protected-mode no|g" /etc/redis/redis.conf
# Expose the Redis port
EXPOSE 6379

# Start Redis when the container is run
CMD ["redis-server", "--protected-mode" ,"no"] 

```
