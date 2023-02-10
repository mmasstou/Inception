# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    remove.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mmasstou <mmasstou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/08 16:40:52 by mmasstou          #+#    #+#              #
#    Updated: 2023/02/10 18:21:45 by mmasstou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh
rm -rf /home/${USER}/Data
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker volume rm $(docker volume ls -q)
