# powerDatabase

## What does it deliver:
The bash script and sql files together can be used to create a power database from scratch. 
It will create a database that is defined in the .env file and creates all schemas tables, relations and indices in the database itself. After the script completes, a docker container is running with a timescaledb and grafana. Some tables are filled with initial data, all of them located in the common schema. 

## Why?
There are a lot of datasets that are published that are related to the European Energy landscape. Each datavendor and each dataset use their own definitions. The one metric that ties the landscape together is time. This database aims to facilitate any and all timeseries dataset and makes them easier to interpret. The use of timescale allows for larger datasets to be collected and used for training or backtesting any logic. 

## Todo: 
- Define and add tables for meteorological measurements
- Define and add tables for unit measurements
- Define and add tables for border measurements
- Add example scripts that retrieve and store data in the timeseries tables
- Apply structured rights to the database
- Include web dbeaver 

## Requirements
Ensure docker desktop is installed. Follow the guide here: https://docs.docker.com/desktop/
Clone this repo and make sure a .env is placed in the root folder of the project. 

The project can be deployed once docker desktop is running and when the .env is created. 

The .env file should contain the following entries: (copy paste the example and things should already work). 
```
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_ADMIN=postgres
POSTGRES_PASSWORD=access123

#Database access 
POWER_DB=electric
POWER_ADMIN=poweradmin
POWER_PASS=poweradmin

#Postgres User for Grafana
GRAFANA_USER=grafana
GRAFANA_PASS=grafanapass
#Grafana application admin password
GF_SECURITY_ADMIN_PASSWORD=grafanapass
```
The first part contains the POSTGRES admin section, together with the host and port where Postgres is running. The second part contains the settings for the Power Database and the Grafana user that will be created by this script. 

Execute the bash script 'hbfs.sh', this should deploy all in one go. 