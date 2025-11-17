
THEONE			=	$(word 2, $(MAKECMDGOALS))
COMPOSE_PATH	=	./srcs/docker-compose.yml


all: up

up: down
	@docker compose --file $(COMPOSE_PATH) up $(THEONE) -d --build

down:
	@docker compose --file $(COMPOSE_PATH) down $(THEONE)

exec:
	@docker compose --file $(COMPOSE_PATH) exec -it $(THEONE) $(word 3, $(MAKECMDGOALS))

re: down up

push:
	@echo -n "dkhl commit: "
	@git add . && read commit && git commit -m "$$commit" && git push

%:
	@:

clean_all:
	@docker rm $$(docker ps -aq) -f 2>&1 1>/dev/null
	@docker rmi $$(docker images -q) 2>&1 1>/dev/null
