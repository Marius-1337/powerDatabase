#!/bin/bash

set -e
set -u
export $(grep -v '^#' .env | xargs)

# Check if user defined in POWER_ADMIN exists
# if exist, skip, else create
if psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -t -c '\du' | cut -d \| -f 1 | grep -qw ${POWER_ADMIN}; then 
   echo "Admin user ${POWER_ADMIN} already exists, skipping creation"
else
   echo "Creating user "${POWER_ADMIN}
   psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "CREATE USER ${POWER_ADMIN} WITH PASSWORD '${POWER_PASS}';"
fi

#Check if database POWER_DB exists
#if exists, skip, else create
if psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -lqt | cut -d \| -f 1 | grep -qw ${POWER_DB}; then
    # database exists
    echo "Database with name '${POWER_DB}' already exist, skipping creation"
else
    # database does not exist, creating it
    echo "Creating database "${POWER_DB}
    psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "CREATE DATABASE ${POWER_DB} WITH ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';"
    echo "Setting admin for "${POWER_DB} to ${POWER_ADMIN} 
    psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "ALTER DATABASE ${POWER_DB} OWNER TO ${POWER_ADMIN};"
    psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "GRANT ALL PRIVILEGES ON DATABASE ${POWER_DB} TO ${POWER_ADMIN};" 
fi

#Switching to POWER_DB database
export PGPASSWORD=${POWER_PASS}
echo "Creating schemas"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f createschemas.sql 2>&1 > /dev/null

echo "Creating common.country and common.continent tables"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/country.sql 2>&1 > /dev/null
echo "Creating common.area table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/area.sql 2>&1 > /dev/null
echo "Creating common.datasource table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/datasource.sql 2>&1 > /dev/null
echo "Creating common.border table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/border.sql 2>&1 > /dev/null
echo "Creating common.fueltype table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/fueltype.sql 2>&1 > /dev/null
echo "Creating common.powerplant table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/powerplant.sql 2>&1 > /dev/null
echo "Creating common.unit table"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/unit.sql 2>&1 > /dev/null

echo "Setting area attributes"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/setattributes_area.sql 2>&1 > /dev/null
echo "Inserting fueltypes"
psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_fueltype_records.sql 2>&1 > /dev/null

unset PGPASSWORD
unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
