# powerDatabase
## Wtf:
The bash script and sql files together can be used to create a power database from scratch. 
It will create a database that is defined in the .env file and creates all schemas tables, relations and indices in the database itself. 
Some tables are filled with initial data, all of them located in the common schema. 

## Todo: 
- check rights and ownership
- correctly define foreign keys and cascading properties
- check if create statement for timescaledb tables needs anything additional
- check if Italian regions (regions in general) need validity dates (when created, when cease to exist)

## Requirements
Ensure pqsl is installed. A quick guide on how to install it locally on your mac: 
```
brew update
brew install libpq
brew link --force libpq
```
then add it to your path, something such as (might vary on your system)
```
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc
```
The psql tool should be working from command line after all this is one. the bash script requires psql to be available on the machine where it is running. 

The bash script sets all environment variables for psql when it is started. For this it relies on a .env file that contains the following entries: 
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


