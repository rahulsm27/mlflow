# include .envs/.mlflow-common
# include .envs/.mlflow-dev
# include .envs/.postgres

include .env

export

DOCKER_COMPOSE_RUN = sudo docker-compose run --rm mlflow-server
DOCKER_COMPOSE_EXEC = sudo docker-compose exec mlflow-server
lock-dependencies: BUILD_POETRY_LOCK = /poetry.lock.build
# to build the image
build:
	sudo docker-compose build 

# to start containers after building the image
up:
	sudo docker-compose up -d 

down:
	sudo docker-compose down

exec-in: up
	sudo docker exec -it local-mlflow-tracking-server bash

lock-dependencies:
	${DOCKER_COMPOSE_RUN} bash -c "if [ -e ${BUILD_POETRY_LOCK}]; then cp ${BUILD_POETRY_LOCK} ./poetry.lock; else poetry lock; fi"
