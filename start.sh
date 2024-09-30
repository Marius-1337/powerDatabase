#!/bin/bash

set -e
set -u

# Check if .env file exists in current directory and 
# load all environment variables from .env for the postgres database(s)

printf "Checking if .env exists: "
if [ -f ".env" ]; then
    printf "check\n"
    printf "Setting variables from .env\n"
    export $(grep -v '^#' .env | xargs)
    # Check if user defined in POWER_ADMIN exists
    # if exist, skip, else create
    if psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -t -c '\du' | cut -d \| -f 1 | grep -qw ${POWER_ADMIN}; then 
        echo "Admin user ${POWER_ADMIN} already exists, skipping creation"
    else
        printf "Create user %s: " "${POWER_ADMIN}"
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "CREATE USER ${POWER_ADMIN} WITH PASSWORD '${POWER_PASS}';"
        printf "Create user %s: " "${GRAFANA_USER}"
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "CREATE USER ${GRAFANA_USER} WITH PASSWORD '${GRAFANA_PASS}';"
        
    fi

    #Check if database POWER_DB exists
    #if exists, skip, else create
    if psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -lqt | cut -d \| -f 1 | grep -qw ${POWER_DB}; then
        # database exists
        echo "Database with name '${POWER_DB}' already exist, skipping any further creation"
    else
        # database does not exist, creating it
        printf "Creating database: %s: " "${POWER_DB}"
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "CREATE DATABASE ${POWER_DB} WITH ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';"
        printf "Setting admin for: %s to %s: " "${POWER_DB}" "${POWER_ADMIN}" 
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "ALTER DATABASE ${POWER_DB} OWNER TO ${POWER_ADMIN};"
        printf "Granting all privileges to %s on %s: " "${POWER_ADMIN}" "${POWER_DB}"
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "GRANT ALL PRIVILEGES ON DATABASE ${POWER_DB} TO ${POWER_ADMIN};" 
        printf "Granting read privileges to %s on %s: " "${GRAFANA_USER}" "${POWER_DB}"
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_ADMIN} -d ${POSTGRES_DB} -c "grant pg_read_all_data to ${GRAFANA_USER};"

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
        echo "Creating common.asset table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/asset.sql 2>&1 > /dev/null
        echo "Creating common.meteomodel table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/meteomodel.sql 2>&1 > /dev/null
        echo "Creating common.meteomeasurement table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/meteomeasurement.sql 2>&1 > /dev/null
        echo "Creating area.actual_generation table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f area/actual_generation.sql 2>&1 > /dev/null
        echo "Creating market.DAPrices table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f market/DAPrices.sql 2>&1 > /dev/null
        echo "Creating market.IDPrices table"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f market/IDPrices.sql 2>&1 > /dev/null
        echo "Inserting common.datasource records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_datasource_records.sql 2>&1 > /dev/null
        echo "Inserting common.area records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_area_records.sql 2>&1 > /dev/null
        echo "Setting common.area attributes"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/setattributes_area.sql 2>&1 > /dev/null
        echo "Inserting common.border records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_border_records.sql 2>&1 > /dev/null
        echo "Inserting common.fueltypes records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_fueltype_records.sql 2>&1 > /dev/null
        echo "Inserting common.meteo-model records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_meteomodels_records.sql 2>&1 > /dev/null
        echo "Inserting common.meteomeasurement records"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f common/insert_meteomeasurement_records.sql 2>&1 > /dev/null
        echo "Creating meteorology.asset_forecast"
        psql -h ${POSTGRES_HOST} -U ${POWER_ADMIN} -d ${POWER_DB} -f meteorology/asset_forecast.sql 2>&1 > /dev/null
    fi
    # cleanup crew to isle 5
    printf "unsetting variables\n"
    unset PGPASSWORD
    unset $(grep -v '^#' .env | sed -E 's/(.*)=.*/\1/' | xargs)
else 
    echo ".env does not exist, please create this first. Check README.\n"
fi