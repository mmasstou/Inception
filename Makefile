NAME=inception


all: $(NAME)

$(NAME):build

build:
	@sh ./srcs/requirements/tools/create.sh
	@docker-compose -f  ./srcs/docker-compose.yml  build
up:
	@sh ./srcs/requirements/tools/create.sh
	@docker-compose -f  ./srcs/docker-compose.yml  up --build
down:
	@docker-compose -f ./srcs/docker-compose.yml  down
start:
	@docker-compose -f ./srcs/docker-compose.yml  start
stop:
	@docker-compose -f ./srcs/docker-compose.yml  stop	
push:
	@git status
	@read -p "Files To Add:" files; git add "$$files" 
	@ read -p "Message:" message; \
	git commit -m "$$message"; \
	git push origin master

clean: down
	@sh srcs/requirements/tools/remove.sh
