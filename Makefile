ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# This command is only executed once to create the basic symfony stuff.
# I left it here to show you how I install my projects. Everything through docker.
init:
	@docker run --rm \
         -u "$(id -u):$(id -g)" \
         -v "$(shell pwd):/var/www/html" \
         -w /var/www/html \
         laravelsail/php82-composer:latest \
         composer create-project symfony/skeleton:"7.0.*" .
bootup:
	./ops/scripts/bootstrap.sh

build:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} config
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} build --no-cache --progress=plain

start:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} up -d
#	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} up -d --build

#traefik-start:
#	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} -f ${DOCKER_COMPOSE_TRAEFIK} --env-file ${PROJECT_ENV} up -d

stop: kill
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} rm -f

kill:
	@docker-compose -p ${COMPOSE_PROJECT_NAME} -f ${DOCKER_COMPOSE} --env-file ${PROJECT_ENV} kill
enter:
	@./ops/scripts/docker-enter.sh

enter-code:
	@docker exec -ti -u root ${CONTAINER_CODE_NAME} bash

open:
	open "${APP_URL}:${APP_PORT}"

docker-shared-network-connect:
	@./ops/scripts/docker-shared-netwrok.sh