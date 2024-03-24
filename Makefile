VOLUME = /home/gurodrig/data/wordpress /home/gurodrig/data/mariadb
NAME = srcs/docker-compose.yml

all: build up

build:
	mkdir -p $(VOLUME)
	docker compose -f $(NAME) build

up:
	docker compose -f $(NAME) up -d

down:
	docker compose -f $(NAME) down

clean: down
	docker system prune -af
	docker volume prune -f
	rm -rf $(VOLUME)

re: clean all
