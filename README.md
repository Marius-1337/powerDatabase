# powerDatabase

# Todo: 
- check rights and ownership
- correctly define foreign keys and cascading properties
- check if create statement for timescaledb tables needs anything additional
- check if Italian regions (regions in general) need validity dates (when created, when cease to exist)

# Requirements
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
The psql tool should be working from command line after all this is one. the bash script requiers psql to be available on the machine where it is running. 

The bash script sets all environment variables for psql when it is started. For this it relies on a .env file that contains the following entries: 
```
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_ADMIN=postgres
PGPASSWORD=access123

POWER_DB=enecopowerdb
POWER_ADMIN=poweradmin
POWER_PASS=poweradmin
```
The first part contains the POSTGRES admin section, together with the host and port where Postgres is running. The second part contains the settings for the Power Database that will be created by this script. 
 
In this format:
- hostname: This is the hostname of the server where the PostgreSQL server is running.
- port: This is the port on which the PostgreSQL server is listening.
- database: This is the database to which you want to connect.
- username: This is the username that you want to use to connect to the database.
- password: This is the password of the username.
Each line in the .pgpass file represents connection information for a specific database.
The fields are separated by a colon (:) and can be replaced with an asterisk * as a wildcard to match any value.
The psql reads the password file and uses the first matching. Therefore, it’s important to order the entries with more specific information first, followed by more general wildcard entries, to ensure the proper behavior.
Example: localhost:5432:*:postgres:moreSecure

