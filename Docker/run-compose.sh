#!/bin/bash
docker pull mysql:5.7
docker pull rabbitmq:3-management
docker pull redis

mkdir -p volume

if [ ! -d "$PWD/volume/elasticsearch" ]; then
   mkdir -p volume/elasticsearch/data
   chmod 777 -R $PWD/volume/elasticsearch/
fi

if [ ! -d "$PWD/volume/mysql" ]; then
   mkdir -p volume/mysql/data
   chmod 777 -R $PWD/volume/mysql
fi

mkdir -p volume/rabbitmq/data
mkdir -p volume/redis/data


if [ -z $1 ]; then
  chmod 777 -R $PWD/volume/
  docker-compose -f docker-compose.yml up -d
elif [[ $1 = "up" ]]; then
  chmod 777 -R $PWD/volume/
elif [[ $1 = "down" ]]; then
  docker-compose -f docker-compose.yml down
fi

