SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;
SET escape_string_warning=off;
SET default_tablespace = '';
SET default_table_access_method = heap;
SET SCHEMA 'common';

START TRANSACTION;

CREATE TABLE IF NOT EXISTS common.datasource (
	id serial4 NOT NULL,
	name varchar NOT NULL,
	fullname varchar NULL,
  	url varchar NULL,
  	owner varchar NOT NULL,
  	lastupdate timestamptz NOT NULL,
	CONSTRAINT datasource_pk PRIMARY KEY (id)
);
COMMIT;

INSERT INTO common.datasource ("name", fullname, url, "owner", lastupdate) VALUES('ENTSO-e', 'ENTSO-e', 'entsoe.eu', 'Marius', '2024-05-07 00:00:00.000');
INSERT INTO common.datasource ("name", fullname, url, "owner", lastupdate) VALUES('Wattsight', 'Wattsight, also known as Volue', 'https://api.volueinsight.com', 'Marius', '2024-07-23 00:00:00.000');