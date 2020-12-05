#!/usr/bin/env bash

set -euxo pipefail

function lb() {
  java -jar liquibase.jar \
          --classpath=postgresql-42.2.12.jar \
          --changeLogFile=migrations.xml \
          --url=jdbc:postgresql://postgres:5432/postgres \
          --username=postgres \
          --password=postgres \
          --logLevel=debug \
          "$@"
}

# first apply all the changes
lb migrate

# then rol them back
lb rollbackCount 2

# then apply them one, by one
lb updateCount 1
# normally our tests would delete the last entry from databasechangelog
# and attempt to update again to ensure that our scripts are idempotent.
# delete from databasechangelog where orderexecuted = (select max(orderexecuted) from databasechangelog);
# lb updateCount 1

lb updateCount 1
