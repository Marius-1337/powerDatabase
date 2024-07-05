docker cp init.sql Eneco-Master-Postgres:/docker-entrypoint-initdb.d/init.sql 
docker exec -u postgres Eneco-Master-Postgres psql postgres postgres -f /docker-entrypoint-initdb.d/init.sql
