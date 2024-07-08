# powerDatabase

Todo: 
- check rights and ownership
- correctly define foreign keys and cascading properties
- check if create statement for timescaledb tables needs anything additional
- check if Italian regions (regions in general) need validity dates (when created, when cease to exist)

Ensure pqsl is installed
Have psql installed: 
brew update
brew install libpq
brew link --force libpq
then add it to your path, something such as (might vary on your system)
echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> ~/.zshrc

psql should be working from command line

Have .pgpass and .env in working dir
Create a .pgpass in your homedirectory. 
The .pgpass file is a plain text file that contains one or more lines with the following format:

hostname:port:database:username:password
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

