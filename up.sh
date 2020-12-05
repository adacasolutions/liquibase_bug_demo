#!/usr/bin/env bash

if [ -n "$VERBOSE" ]; then
  set -x
fi

set -uo pipefail

# build a custom image locally to showcase bug
docker build -t example_migration .

# start db instance
docker-compose -p example up -d postgres

while [ "`docker inspect -f {{.State.Health.Status}} example_postgres_1`" != "healthy" ]; do     sleep 2; done

docker inspect -f {{.State.Health.Status}} example_postgres_1

docker-compose -p example up -d liquibase

docker logs -f example_liquibase_1
