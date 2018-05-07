#!/usr/bin/env bash

set -e

compose=""
activity="reload"
while getopts 'c:a:' flag; do
  case "${flag}" in
    c) compose="${OPTARG}" ;;
    a) activity="${OPTARG}" ;;
  esac
done

if [ "$activity" != "delete" ] ; then
    project_name=${PWD##*/}

    if [ "$compose" = "pgadmin4" ] ; then
        project_name="pgadmin4"
        echo "Using pgadmin4 docker-compose"
        composer_file="./compose/docker-compose.pgadmin4.yml"
    elif [ "$compose" = "portainer" ] ; then
        project_name="portainer"
        echo "Using portainer docker-compose"
        composer_file="./compose/docker-compose.portainer.yml"
    elif [ "$compose" = "registry" ] ; then
        project_name="registry"
        echo "Using registry docker-compose"
        composer_file="./compose/docker-compose.registry.yml"
    elif [ "$compose" = "registry-ui" ] ; then
        project_name="registry-ui"
        echo "Using registry-ui docker-compose"
        composer_file="./compose/docker-compose.registry-ui.yml"
    fi
fi

if [ "$activity" = "reload" ] ; then
    echo "Reloading docker containers..."
    COMPOSE_IGNORE_ORPHANS=1 docker-compose -p "$project_name" -f docker-compose.yml -f "$composer_file" down
    COMPOSE_IGNORE_ORPHANS=1 docker-compose -p "$project_name" -f docker-compose.yml -f "$composer_file" build
    COMPOSE_IGNORE_ORPHANS=1 docker-compose -p "$project_name" -f docker-compose.yml -f "$composer_file" up -d
    echo "Docker containers reloaded."
elif [ "$activity" = "delete" ] ; then
    read -p "Are you sure you want remove ALL docker containers on host machine (docker-compose will be ignored)? [Y/n]" -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]] ; then
        [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
    fi

    echo "Removing ALL docker containers on machine..."
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
    echo "ALL docker containers removed."
else
    COMPOSE_IGNORE_ORPHANS=1 docker-compose -p "$project_name" -f docker-compose.yml -f "$composer_file" "$activity"
fi
