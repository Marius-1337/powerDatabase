#!/bin/bash
DOCKERNAME=Eneco-Master-Postgres

DATABASEHOST=localhost
DATABASEPORT=5432
DATABASENAME=testpowerdb
DATABASEUSER=poweradmin
DATABASEPASS=poweradmin

echo "Using" $DOCKERNAME container as Postgres instance
echo "Copy init.sql to container"
docker cp init.sql $DOCKERNAME:/docker-entrypoint-initdb.d/init.sql > /dev/null
echo "Execute init.sql inside container to create $DATABASENAME" 
docker exec -u postgres $DOCKERNAME psql postgres postgres -v dbname=$DATABASENAME -f /docker-entrypoint-initdb.d/init.sql > /dev/null
echo "creating schemas in $DATABASENAME"
psql -h localhost -U poweradmin -d $DATABASENAME < createdatabase.sql >/dev/null
psql -h localhost -U poweradmin -d $DATABASENAME < common/country.sql >/dev/null
