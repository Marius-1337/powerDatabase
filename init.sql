CREATE USER poweradmin WITH ENCRYPTED PASSWORD 'poweradmin';
CREATE DATABASE testpowerdb WITH ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
ALTER DATABASE testpowerdb OWNER TO poweradmin;
GRANT ALL PRIVILEGES ON DATABASE testpowerdb TO poweradmin;
